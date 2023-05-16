trigger DuplicateAccount on Account (before insert,before update) {
    
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            DuplicateAccountHelper.duplicateRecords(trigger.new);
        }
        
    }

}