trigger CopyBillingToShipping on Account (before insert,before update) {
    
    /*if(trigger.isInsert || trigger.isUpdate){
        CopyBillingToShipping.copyBillingToShipping(trigger.new,trigger.oldMap);
        CopyBillingToShipping.populateRatingOnAccount(trigger.new,trigger.oldMap);
    }*/

}