public class Opty_Example {
    
    public static void invoke(Map<Id,Opportunity> newMap, Map<Id,Opportunity> oldMap){
        Set<Id> keys = oldMap.keySet();
        for(Id k : keys){
            Opportunity oldrecords = oldMap.get(k);
            Opportunity newrecords = newMap.get(k);
            if(oldrecords.StageName != newrecords.StageName && newrecords.StageName == 'Closed Won'){
                newrecords.CloseDate = System.today();
            }
        }
        
        
    }
}