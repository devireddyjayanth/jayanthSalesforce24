public class OpportunityStageHelper {
    
    public static void ceforeOrAfterOppStage(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Lost'){
                opp.Description = 'Opportunity stage is Closed Lost';
            }else if(opp.StageName == 'Closed Won'){
                opp.Description = 'Opportunity stage is Closed Won';
            }else {
                opp.Description = 'Opportunity is Open';
            }
        }
        
    }

}