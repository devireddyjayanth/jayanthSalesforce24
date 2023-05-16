global class BatchApex_2 implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select Id,name from Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account acc : accList){
            acc.ownership = 'public';
        }
        update accList;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}