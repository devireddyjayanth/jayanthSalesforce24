public class AccountHelperTrigger {
    
    public static void beforeUpdate(List<Account> accList, Map<Id,Account> accListMap){
        
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                acc.Description = 'Old Phone number : '+accListMap.get(acc.Id).Phone + 'New Phone number :'+acc.Phone;
            }
        }
    }
    
    public static void afterUpdate(List<Account> accList, Map<Id,Account> accListMap){
        
        List<Contact> conList = new List<Contact>();
        Map<Id,Account> accountsMap = new Map<Id,Account>();
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                accountsMap.put(acc.Id,acc);
            }
        }
        if(accountsMap.size()>0){
            for(Contact con : [SELECT Id,Phone,AccountId from Contact where AccountId IN: accountsMap.keyset()]){
                if(accountsMap.containsKey(con.AccountId)){
                    con.Phone = accountsMap.get(con.AccountId).Phone;
                    conList.add(con);
                }
            }
        }
        update conList;
    }
    
    public static void beforeDelete(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError('You cannot delete Active Account');
            }
        }
    }
    
    public static void afterDelete(Map<Id,Account> accListMap){
        List<Contact> conList = new List<Contact>();
        
        for(Contact con : [SELECT Id,Phone,AccountId from Contact where AccountId IN: accListMap.keySet()]){
            conList.add(con);
            system.debug('Contact is deleted');
        }
        delete conList;
        
    }
    
    public static void afterUnDelete(List<Account> accList){
        List<Account> accoList = new List<Account>();
        
        for(Account a : accList){
            Account acc = new Account();
            acc.Id = a.Id;
            acc.Active__c = 'Yes';
            accoList.add(acc);
        }
        update accoList;
    }
    
    public static void beforeInsert(List<Account> accList){
        
        for(Account acc : accList){
            acc.Phone = '0099888';
            acc.Active__c = 'Yes';
        }
        
    }
    
    public static void afterInsert(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name + '@';
            con.Phone = acc.Phone;
            conList.add(con);
        }
        insert conList;
    }
    
}