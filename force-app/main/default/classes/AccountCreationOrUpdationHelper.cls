public class AccountCreationOrUpdationHelper {
    
    public static void beforeInsertOrUpdate(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
}