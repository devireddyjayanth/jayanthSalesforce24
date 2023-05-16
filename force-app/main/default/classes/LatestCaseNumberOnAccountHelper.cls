public class LatestCaseNumberOnAccountHelper {
    
    public static void latestCaseNumber(List<Case> caseList){
        
        List<Account> accList = new List<Account>();
        
        for(Case cs : caseList){
            if(cs.AccountId != null){
                Account acc = new Account();
                acc.Id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accList.add(acc);
            }
        }
        update accList;
    }
}