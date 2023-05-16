trigger ContactEmailCopy on Contact (before insert) {
    
    if(trigger.isBefore){
        if(trigger.isInsert ){
            ContactEmailCopyHelper.contactEmailCopy(trigger.new);
        }
    }
    
    

}