public class AccountPhoneUpdateConPhoneHelper {
    
    public static void afterUpdate(List<Account> newValues, Map<Id,Account> oldValues){
        
        map<Id,Account> accmap = new map<Id,Account>();
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : newValues){
            if(acc.Phone != null && acc.Phone != oldValues.get(acc.Id).Phone){
                accmap.put(acc.Id,acc);
            }
        }
        
        if(accmap.size()>0){
            List<Contact> conl = [SELECT Id,Phone,AccountId from contact where AccountId IN: accmap.keySet()];
            for(Contact con : conl){
                if(accmap.containsKey(con.AccountId)){
                    con.Phone = accmap.get(con.AccountId).Phone;
                    conList.add(con);
                }
            }
        }
        update conList;
        
    }

}