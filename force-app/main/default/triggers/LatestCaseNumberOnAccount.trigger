trigger LatestCaseNumberOnAccount on Case (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            LatestCaseNumberOnAccountHelper.latestCaseNumber(trigger.new);
        }
    }
}