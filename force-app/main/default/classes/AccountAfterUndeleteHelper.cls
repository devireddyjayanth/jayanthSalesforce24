public class AccountAfterUndeleteHelper {
    
    public static void afterUndeleteAccount(List<Account> accList){
        
        List<Account> updateAccList = new List<Account>();
        for(Account acc : accList){
            Account accl = new Account();
            accl.Id = acc.Id;
            accl.Active__c = 'Yes';
            updateAccList.add(accl);
        }
        update updateAccList;

    }

}