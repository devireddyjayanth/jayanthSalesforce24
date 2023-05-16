public class OpportunityShareHelper {
    
    public static void oppShareRecords(List<Opportunity> oppList){
        User u=[select id from User where alias='sub'];
        List<OpportunityShare> oppShareList = new List<OpportunityShare>();
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                OpportunityShare ops = new OpportunityShare();
                ops.OpportunityId = opp.Id;
                ops.UserOrGroupId = u.Id;
                ops.OpportunityAccessLevel = 'Edit';
                ops.RowCause = 'Manual';
                oppShareList.add(ops);
            }
        }
        insert oppShareList;
    }

}