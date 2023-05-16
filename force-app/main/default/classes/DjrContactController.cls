public with sharing class DjrContactController {
    
    @AuraEnabled(cacheable=true)
    public static string methodName(String accIds){
        try {
            return [SELECT Id,AccountId,FirstName,LastName FROM  Contact where AccountId =: accIds WITH SECURED_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}