public class AccountTriggerHandlerClass {
    
    public static void beforeInsertRecords(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.AnnualRevenue = 30000;
            }
        }
    }
    
    public static void afterInsertRecords(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
            for(Account acc : accList){
                Opportunity op = new Opportunity();
                op.Name = acc.Name;
                op.AccountId = acc.Id;
                op.StageName = 'Prospecting';
                op.CloseDate = System.today()+6;
                oppList.add(op);
            }
            if(!oppList.isEmpty()){
                insert oppList;
            }
    }
    
}