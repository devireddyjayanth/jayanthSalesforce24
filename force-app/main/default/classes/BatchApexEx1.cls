global class BatchApexEx1 implements Database.Batchable<sobject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id,Name from Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accList){
        
        for(Account acc : accList){
            acc.Name = 'Jayanth@';
            System.debug('Name '+ acc.Name);
        }
        update accList;
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}