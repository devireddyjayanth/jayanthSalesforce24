public class AccountAfterDeleteOppHelper {
    
    public static void afterDeleteOppRecords(Map<Id,Account> accountData){
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity opp : [SELECT Id from Opportunity where AccountId IN:accountData.KeySet()]){
            oppList.add(opp);
        }
        delete oppList;
    }
    

}