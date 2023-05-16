public with sharing class DjrApexControllerOne {
    //djrGetContacts
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> djrGetContacts(String accIds){
        
        try {
            return [SELECT Id,AccountId,FirstName,LastName from Contact WHERE AccountId =: accIds WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            return [SELECT Id,AccountId,FirstName,LastName FROM Contact where AccountId =: accId WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}