trigger AccountPhoneUpdateConPhone on Account (after update) {
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            AccountPhoneUpdateConPhoneHelper.afterUpdate(trigger.new, trigger.oldMap);
        }
    }

}