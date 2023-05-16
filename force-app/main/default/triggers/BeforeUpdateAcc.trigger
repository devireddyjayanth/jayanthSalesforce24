trigger BeforeUpdateAcc on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountHelperTrigger.beforeInsert(Trigger.new);
        }else if(Trigger.isAfter){
            AccountHelperTrigger.afterInsert(Trigger.new);
        }
    }
    
    if(trigger.isUpdate){
        if(Trigger.isBefore){
            AccountHelperTrigger.beforeUpdate(Trigger.new, Trigger.oldMap);
        }else if(Trigger.isAfter){
            AccountHelperTrigger.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountHelperTrigger.beforeDelete(Trigger.old);
        }else if(Trigger.isAfter){
            AccountHelperTrigger.afterDelete(Trigger.oldMap);
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isUndelete){
            AccountHelperTrigger.afterUnDelete(Trigger.new);
        }
    }
    
    
}