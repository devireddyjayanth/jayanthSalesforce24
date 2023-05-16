public class BeforeAccountInsertHelper {
    
    public static void findDuplicateAccounts(List<Account> accList){
        
        Set<String> aname = new Set<String>();
        
        for(Account acc : accList){
            aname.add(acc.Name);
        }
        
        List<Account> duplicateNameeList = [SELECT Id,Name from Account where Name =: aname];
        
        set<String> duplicateAccountAccounts = new Set<String>();
        
        for(Account ac : duplicateNameeList){
            duplicateAccountAccounts.add(ac.Name);
        }
        
        for(Account accs : accList){
            if(accs.Name != null){
                if(duplicateAccountAccounts.contains(accs.Name)){
                    accs.addError('Record already Existed with the same Name');
                }
            }
        }

	}
}