public class AccountTriggerHandlerClassOne {
    
    public static void beforeInsertRecord(List<Account> accList){
        List<Account> accnt = new List<Account>();
        for(Account acc : accList){
            acc.AnnualRevenue = 300000;
            acc.Active__c = 'Yes';
            accnt.add(acc);
        } 
    }
    
    public static void afterInsertRecord(List<Account> accList){
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name + '_opp';
            opp.CloseDate = System.today()+4;
            opp.StageName = 'Prospecting';
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
    public static void beforeDeleteRecord(List<Account> accList){
        
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError('Your account is Active you cannot delete Your Accouunt.');
            }
        } 
    }
    
    public static void afterDeleteRecord(Map<Id,Account> IdMapAccount){
        
        List<Opportunity> oppDelList = new List<Opportunity>();
        for(Opportunity opp : [select Id from Opportunity where AccountId IN: IdMapAccount.keySet()]){
            oppDelList.add(opp);
        }
        if(!oppDelList.isEmpty()){
            delete oppDelList;
        }  
    }
    public static void afterUnDeleteRecord(List<Account> accList){
        List<Account> accnewList = new List<Account>();
        for(Account acc : accList){
            Account accnt = new Account();
            accnt.Id = acc.Id;
            accnt.Active__C = 'Yes';
            accnewList.add(accnt);
        }
        if(!accnewList.isEmpty()){
            update accnewList;
        } 
    }
    
    public static void beforeUpdateRecord(List<Account> accList, Map<Id,Account> oldMap){
        
        for(Account acc : accList){
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).phone){
                acc.Description = 'new Mobile number is added to :'+acc.Phone;
            }
        }
    }

}