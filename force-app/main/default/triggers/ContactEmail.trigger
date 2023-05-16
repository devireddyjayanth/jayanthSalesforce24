trigger ContactEmail on Contact (before insert) {
    
    if(trigger.isInsert){
        if(trigger.isBefore){
            ContactEmailHelper.contactEmailhelp(Trigger.new);
        }
    }

}