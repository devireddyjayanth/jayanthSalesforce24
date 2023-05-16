trigger OpportunityShare on Opportunity (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            OpportunityShareHelper.oppShareRecords(trigger.new);
        }
    }
    
    

}