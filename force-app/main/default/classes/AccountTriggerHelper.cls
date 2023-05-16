public class AccountTriggerHelper {
    
    public static void beforeUpdateRecord(List<Account> accList, Map<Id,Account> accListMap){
        
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                acc.Description = 'Old Phone Number :'+ accListMap.get(acc.Id).Phone + ' new Phone number :'+acc.Phone;
            }
        }
        
    }

}