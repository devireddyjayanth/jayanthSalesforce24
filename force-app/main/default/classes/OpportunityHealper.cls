public class OpportunityHealper {
    
    public static void oppRecordCreation(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount!=null && opp.Amount >=10000 && opp.Amount <=50000){
                opp.Description = 'Hot Opportunity';
            }
        }
    }

}