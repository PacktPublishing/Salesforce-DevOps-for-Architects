@isTest
public with sharing class ProductTriggerHandlerTest
{
    @TestSetup
    static void setup()
    {
        // Create multiple products 
        List<Product__c> products = new List<Product__c>{ 
            new Product__c(Description__c='Product A', Price__c=100), 
            new Product__c(Description__c='Product B', Price__c=50) 
        }; 
        insert products;     
    }

    @isTest
    static void testTotal()
    {
        List<Product__c> products = [SELECT Id, Description__c, Price__c from Product__c];
        Decimal total = 0.0;
        test.startTest();
        for(Product__c prod : products)
        {
            total += prod.Price__c;
        }
        Assert.areEqual(150, total, 'Total should be 150');
    }
}