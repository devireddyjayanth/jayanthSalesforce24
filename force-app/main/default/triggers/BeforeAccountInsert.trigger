trigger BeforeAccountInsert on Account (before insert,before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || trigger.isUpdate){
            BeforeAccountInsertHelper.findDuplicateAccounts(trigger.new);
        }
    }    

}