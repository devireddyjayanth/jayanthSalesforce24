trigger NewContOrNewOppInAccount on Account (after insert,before update) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            NewContOrNewOppInAccountHelper.createContactOrOppInAcc(trigger.new);
        }else if(trigger.isBefore){
            NewContOrNewOppInAccountHelper.populateIndustryRating(trigger.new,trigger.oldMap);
        }
    }
    if(trigger.isUpdate){
        if(trigger.isBefore){
            NewContOrNewOppInAccountHelper.populateAccountDescription(trigger.newMap,trigger.oldMap);
        }else if(trigger.isAfter){
            NewContOrNewOppInAccountHelper.populateIndustryRating(trigger.new,trigger.oldMap);
        }
    }
}