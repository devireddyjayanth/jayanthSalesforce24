public class CalculateCaseOrigin {
    
    @future
    public static void countCasebasedOnOrigin(List<Id> accIds){
        List<Account> accList = [Select Id, Case_Through_Email__c, Case_Through_Phone__c, Case_Through_Web__c, (select Id,Origin from cases) from Account where Id IN: accIds];
        
        for(Account acc : accList){
            
        }
        
        
    }

}