trigger CaseSharing on Case (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            oppShareListHelper.caseShareRecords(trigger.new);
        }
    }
    
    

}