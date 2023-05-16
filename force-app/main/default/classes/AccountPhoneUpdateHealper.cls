public class AccountPhoneUpdateHealper {
    
    public static void phoneUpdateValues(List<Account> accList, Map<Id,Account> oldAccMap){
        
        for(Account acc : accList){
            if(acc.Phone!=null && acc.Phone != oldAccMap.get(acc.Id).Phone){
                acc.Description = 'Phone is Updated! old value:' + oldAccMap.get(acc.Id).Phone + ' & new Value is '+acc.Phone;
            }
        }
        
        
        
    }
}