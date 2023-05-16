public with sharing class z1ApexClass {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getListOfConOne(String accId){
        try {
            return[SELECT Id,AccountId,LastName,FirstName FROM Contact WHERE AccountId =: accId WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}