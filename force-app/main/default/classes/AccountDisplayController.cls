public class AccountDisplayController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [select Id,Name,Phone from Account LIMIT 5];
    }

}