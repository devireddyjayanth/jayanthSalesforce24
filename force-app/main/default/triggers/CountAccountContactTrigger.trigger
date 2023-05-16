trigger CountAccountContactTrigger on Contact (after insert,after delete) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isDelete){
            ContactApexHelper.countingMethod(Trigger.new,trigger.old);
        }
    }
    
}