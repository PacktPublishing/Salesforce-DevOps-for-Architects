import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import registerCall from '@salesforce/apex/HelloContactController.registerCall';

export default class helloContact extends LightningElement {
    @api recordId; // This will hold the Contact Record Id when placed on a Contact record page

    registerCall() {
        registerCall({ contactId: this.recordId })
            .then(result => {
                const evt = new ShowToastEvent({
                    title: "Success",
                    message: "Call registered successfully.",
                    variant: "success",
                });
                this.dispatchEvent(evt);
            })
            .catch(error => {
                const evt = new ShowToastEvent({
                    title: "Error",
                    message: error.body.message,
                    variant: "error",
                });
                this.dispatchEvent(evt);
            });
    }
}
