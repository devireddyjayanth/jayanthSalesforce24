public class ContactController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        return [SELECT Id, FirstName, LastName, Email, Phone from Contact WHERE AccountId =: recordId];
    }

}