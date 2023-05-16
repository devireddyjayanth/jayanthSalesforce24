trigger AccountFieldUpdationtesOrNo on Account (after update) {
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
            AccountFieldUpdationtesOrNoHelper.accountAfterUpdate(trigger.newMap, trigger.oldMap);
        }
    }
}