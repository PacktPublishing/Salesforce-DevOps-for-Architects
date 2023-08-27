@isTest
public class HelloContactControllerTest {
    
    @isTest
    static void testRegisterCall_Success() {
        Contact testContact = new Contact(LastName = 'Doe', Email = 'johndoe@example.com');
        insert testContact;

        Test.startTest();
        String result = HelloContactController.registerCall(testContact.Id);
        Test.stopTest();

        System.assertEquals('Success', result, 'Should create a call record');
    }

    @isTest
    static void testRegisterCall_InvalidContactId() {
        String invalidContactId = '003XXXXXXXXXXXXXXX';
        
        Test.startTest();
        String result = HelloContactController.registerCall(invalidContactId);
        Test.stopTest();

        System.assertEquals('Invalid Contact Id', result, 'Exception message should indicate failure to register call due to invalid Contact Id');
    }
}
