trigger ApexAccountTrigger on Account (before insert,after insert,before update, after update,before delete,after delete,after undelete) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            ApexAccountTriggerHelper.beforeAccountInsert(Trigger.new);
        }else if(Trigger.isAfter){
            ApexAccountTriggerHelper.afterAccountInsert(Trigger.new);
        }
    }
    
    if(trigger.isUpdate){
        if(trigger.isBefore){
            ApexAccountTriggerHelper.beforeAccountUpdate(Trigger.new,Trigger.oldMap);
        }else if(trigger.isAfter){
            ApexAccountTriggerHelper.afterAccountUpdate(Trigger.new,Trigger.oldMap);
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            ApexAccountTriggerHelper.beforeAccountDelete(Trigger.old);
        }else if(Trigger.isAfter){
            ApexAccountTriggerHelper.afterAccountDelete(Trigger.oldMap);
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isUndelete){
            ApexAccountTriggerHelper.afterAccountUndelete(Trigger.new);
        }
    }
    
    

}