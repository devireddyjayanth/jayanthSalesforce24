trigger AccountContactCounts on Contact (after insert,after update, after delete) {
    
    if(Trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isDelete){
            ContactCountHelper.contactCount(trigger.new,trigger.old);
        }
    }
    

}