public with sharing class HelloContactController {
    @AuraEnabled
    public static void registerCall(String contactId) {
        try {
            Call__c newCall = new Call__c();
            newCall.Contact__c = contactId;
            newCall.Called_By__c = UserInfo.getUserId();
            newCall.When_Called__c = System.now();
            insert newCall;
        } catch (Exception e) {
            throw new AuraHandledException('Failed to register the call: ' + e.getMessage());
        }
    }
}
