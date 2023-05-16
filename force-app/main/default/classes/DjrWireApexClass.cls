public with sharing class DjrWireApexClass {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> djrgetContacts(String accId){
        try {
            return[SELECT AccountId,Id,FirstName,LastName FROM Contact WHERE AccountId =: accId WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}