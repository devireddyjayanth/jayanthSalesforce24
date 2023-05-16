public with sharing class djtContactControllerOne {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            return [SELECT Id,AccountId,FirstName,LastName FROM Contact Where AccountId =: accId WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}