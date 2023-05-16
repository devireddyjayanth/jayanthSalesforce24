trigger AccountCreationOrUpdation on Account (before insert,before update) {
    
    if(trigger.isInsert){
        if(trigger.isBefore){
            AccountCreationOrUpdationHelper.beforeInsertOrUpdate(trigger.new);
        }
    }
    
    if(trigger.isUpdate){
        if(trigger.isBefore){
            AccountCreationOrUpdationHelper.beforeInsertOrUpdate(trigger.new);
        }
        
    }
}