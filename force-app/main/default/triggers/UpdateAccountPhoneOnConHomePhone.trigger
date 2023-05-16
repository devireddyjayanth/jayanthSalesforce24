trigger UpdateAccountPhoneOnConHomePhone on Account (after Update) {
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
            //UpdateAccountPhoneOnConHomePhoneHelper.updateAccPhoneOnConHomePhone(trigger.newMap,trigger.oldMap);
            //UpdateAccountPhoneOnConHomePhoneHelper.copyBillingAddressToMillingAddress(trigger.newMap,trigger.oldMap);
        }
    }
}