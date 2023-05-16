public class AccountAfterPhoneUpdateHandler {
    
    										//11111						//0015g0000187rsbAAA   00000000
    public static void accountAfterUpdate(List<Account> accList, Map<Id, Account> oldAccMap){
        
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accToAccountMap = new Map<Id, Account>();
        
        for(Account acc : accList){
            if(acc.Phone !=null && acc.Phone != oldAccMap.get(acc.Id).Phone){
                
                accToAccountMap.put(acc.Id,acc);
            } 
        }
        
        
        
        if(conList.size()>0){
            for(Contact con : [select Id,phone,AccountId from Contact where AccountId IN :accToAccountMap.keyset()]){
                if(accToAccountMap.containsKey(con.AccountId)){
                    con.Phone = accToAccountMap.get(con.AccountId).phone;
                    conList.add(con);
                }
            }
        }
        if(conList.size()>0){
            update conList;
        }
        
        
    }

}