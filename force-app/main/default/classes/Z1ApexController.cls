public with sharing class Z1ApexController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id,Name,type,industry,phone from Account limit 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> getAccountsWithOutCacheable(){
        try {
            return [SELECT Id,Name,type,industry,phone from Account limit 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Integer getSumResult(Integer firstNumner,Integer secondNumber){
        return (firstNumner+secondNumber);
    }

}