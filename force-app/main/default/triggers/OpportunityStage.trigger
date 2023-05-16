trigger OpportunityStage on Opportunity (before insert,before Update) {
    
    if(trigger.isBefore){
        OpportunityStageHelper.ceforeOrAfterOppStage(trigger.new);
    }
}