trigger CountTotalContactsInAccount on Contact (after insert, after update, after delete, after undelete) {
    //call handler for best practice
    if(Trigger.isinsert || Trigger.isupdate || trigger.isdelete || Trigger.isundelete){
        CountTotalContactsInAccountHelper.afterInsertContactRecords(trigger.newMap, trigger.oldMap);
    }
}