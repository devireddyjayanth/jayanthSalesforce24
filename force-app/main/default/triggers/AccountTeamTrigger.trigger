trigger AccountTeamTrigger on Account (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            AccountTeamTriggerHelper.createNewAccountRecord(trigger.new);
        }
        
    }

}