//when Account Active field is Updated from "Yes" to "No" then Update all related opportunity stage to "Closed Lost" if Stage NOT Equal to Closed Won.
public class AccountFieldUpdationtesOrNoHelper {
    
    public static void accountAfterUpdate(Map<Id,Account> newRecords,Map<Id,Account> oldRecords){
        Set<Id> accIds = new Set<Id>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Id acId : newRecords.keySet()){
            Account newRec = newRecords.get(acId);
            Account oldRec = oldRecords.get(acId);
            if(newRec.Active__c == 'No' && oldRec.Active__c == 'Yes'){
                accIds.add(newRec.Id);
            }
        }
        Opportunity op = new Opportunity();
        //op.StageName
        if(accIds.size()>0){
            List<Opportunity> opps = [SELECT Id,AccountId,StageName from Opportunity where AccountId =:accIds];
            for(Opportunity opp : opps){
                if(opp.StageName != 'Closed Won' && opp.StageName != 'Closed Lost'){
                    opp.StageName = 'Closed Lost';
                    oppList.add(opp);
                }
            }
            update oppList;
        }
        
    }

}