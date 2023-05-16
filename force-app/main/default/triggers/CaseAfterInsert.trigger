trigger CaseAfterInsert on Case (after update) {
    
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            CaseHelperClass.caseStatus(Trigger.new);
        }
    }

}