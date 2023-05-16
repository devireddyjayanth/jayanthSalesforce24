public class NewContOrNewOppInAccountHelper {
    
    public static void createContactOrOppInAcc(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : accList){
            if(acc.New_Contact__c){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                conList.add(con);
            }
            if(acc.New_Opportunity__c && acc.Active__c == 'Yes'){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.CloseDate = System.today();
                opp.StageName = 'Closed Won';
                oppList.add(opp);
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
    public static void populateAccountDescription(Map<Id,Account> newMapAcc, Map<Id,Account> oldMapAcc){
        
        for(Id accId : newMapAcc.keySet()){
            Account newRec = newMapAcc.get(accId);
            Account oldRec = oldMapAcc.get(accId);
            if(newRec.Phone != null && newRec.Phone != oldRec.Phone){
                newRec.Description = 'new Ohone number Is : '+ newRec.Phone +' Old Rec phone '+oldRec.Phone;
            }
        }
    }
    
    public static void populateIndustryRating(List<Account> newMap, Map<id,Account> oldMapAcc){
        for(Account acc : newMap){
            if(acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
        
    }

}