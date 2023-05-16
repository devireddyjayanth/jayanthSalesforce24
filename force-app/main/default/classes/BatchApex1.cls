public class BatchApex1 implements Database.Batchable<Sobject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id,Name from Account limit 5';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account acc : accList){
            acc.Phone = '990099002';
            acc.Active__c = 'Yes';
        }
        update accList;
    }
    public void finish(Database.BatchableContext bc){
        
    }
}