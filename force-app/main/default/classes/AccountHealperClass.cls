public class AccountHealperClass {
    
    public static void beforeInsertRecords(List<Account> accLists){
        for(Account accList : accLists){
                if(accList.Industry == 'Media' || accList.Industry == 'Energy'){
                    accList.Rating = 'Hot';
                }
            }
    }
}