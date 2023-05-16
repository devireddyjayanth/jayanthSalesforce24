public class DuplicateAccountHelper {
    
    public static void duplicateRecords(List<Account> accList){
        Set<String> newAccountName = new Set<String>();
        for(Account acc : accList){
            newAccountName.add(acc.Name);
        }
        
        List<Account> accountOldList = [SELECT Id,Name from Account where Name IN: newAccountName];
        
        Set<String> oldRecords = new Set<String>();
        for(Account a1 : accountOldList){
            oldRecords.add(a1.Name);
        }
        
        for(Account a2 : accList){
            if(oldRecords.contains(a2.Name)){
                a2.addError('duplicate account not allowed');
            }
        }
        
    }

}