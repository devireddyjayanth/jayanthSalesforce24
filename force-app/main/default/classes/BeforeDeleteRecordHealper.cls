public class BeforeDeleteRecordHealper {
    
    public static void beforeDeleteRecord(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError('You cannot delete Active Account');
            }
        }
    }

}