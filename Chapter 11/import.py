from salesforce_bulk import SalesforceBulk
import csv

# Salesforce credentials
username = 'your_username'
password = 'your_password'
security_token = 'your_security_token'

# Create a new bulk API connection
bulk = SalesforceBulk(username=username, password=password, security_token=security_token)

# Define the CSV file and the object in Salesforce
csv_file = 'accounts.csv'
sf_object = 'Account'

# Create a new job for the data import
job = bulk.create_insert_job(sf_object, contentType='CSV')

# Open the CSV file and read its contents
with open(csv_file, 'r') as f:
    reader = csv.reader(f)
    csv_data = [row for row in reader]

# Split the CSV data into batches (Salesforce Bulk API has a batch size limit)
batch_size = 10000  # adjust this based on your needs
batches = [csv_data[i:i + batch_size] for i in range(0, len(csv_data), batch_size)]

# Add each batch of data to the job
for batch in batches:
    csv_batch = '\n'.join([','.join(row) for row in batch])
    bulk.post_batch(job, csv_batch)

# Close the job
bulk.close_job(job)

# Check the results of the job
job_results = bulk.get_batch_results(job)
for result in job_results:
    print(result)
