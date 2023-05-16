public class AccountOppRecordHandler {
    
    public static void createOppRecord(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
            for(Account acc : accList){
                Opportunity opp = new Opportunity();
                opp.AccountId  = acc.Id;
                opp.Name = 'Test-Jan-31';
                opp.CloseDate = System.today();
                opp.StageName = 'Prospecting';
                oppList.add(opp);
            }
            if(!oppList.isEmpty()){
                insert oppList;
            }
    }

}