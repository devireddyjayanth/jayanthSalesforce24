trigger CaseUpdate on Case (before update) {
    
    if(trigger.isUpdate){
        if(trigger.isBefore){
            CaseUpdateHelper.caseUpdate(trigger.new,trigger.oldMap);
        }
    }
    

}