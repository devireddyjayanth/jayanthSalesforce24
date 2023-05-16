public class CountCaseAnAccount {
    
    @future
    public static void countCasesfromAccountId(List<Id> listIds){
        List<Account> accounts = [select Id,Case_Through_Email__c,Case_Through_Phone__c,Case_Through_Web__c,(select Id,	Origin from cases) from Account where Id IN: listIds];
        for(Account acc : accounts){
            Integer Phone = 0, Web = 0,Email = 0;
            for(Case cs : acc.cases){
                if(cs.Origin == 'Phone'){
                    Phone++;
                }else if(cs.Origin == 'Web'){
                    Web++;
                }else if(cs.Origin == 'Email'){
                    Email++;
                }
            }
            acc.Case_Through_Phone__c = Phone;
            acc.Case_Through_Email__c = Email;
            acc.Case_Through_Web__c = Web;
            
        }
        if(!accounts.isEmpty()){
            update accounts;
        }
        
    }

}