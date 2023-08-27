public with sharing class HelloContactController {
    @AuraEnabled
    public static String registerCall(String contactId) {
        if([SELECT count() FROM Contact WHERE Id = :contactId] == 0) {
            return 'Invalid Contact Id';
        }

        Call__c newCall = new Call__c();
        newCall.Contact__c = contactId;
        newCall.Called_By__c = UserInfo.getUserId();
        newCall.When_Called__c = System.now();
        
        Database.SaveResult sr = Database.insert(newCall, false);
        
        if (sr.isSuccess()) {
            return 'Success';
        } else {
            return sr.getErrors()[0].getMessage();
        }
    }
}
