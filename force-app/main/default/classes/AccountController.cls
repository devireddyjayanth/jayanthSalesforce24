public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        
        accList = [select Id,Name from Account LIMIT 5];
        
        return accList;
    }
}