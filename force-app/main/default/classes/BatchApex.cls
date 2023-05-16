global class BatchApex implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select Id,Name from Account';
        return Database.getQueryLocator(query);
    }
        
    
    global void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account acc : accList){
            acc.ownership = 'private';
        }
        update accList;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}