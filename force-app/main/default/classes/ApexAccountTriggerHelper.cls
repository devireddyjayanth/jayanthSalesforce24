public class ApexAccountTriggerHelper {
    
    public static void beforeAccountInsert(List<Account> accList){
        for(Account acc : accList){
            acc.AnnualRevenue = 90000;
            acc.Description = 'Before Insert Trigger';
        }  
    }
    
    public static void afterAccountInsert(List<Account> accList){
        
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        insert conList;
    }
    
    public static void beforeAccountUpdate(List<Account> accList, Map<Id,Account> accListMap){
        
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                acc.Description = ' Old Phone number is '+ accListMap.get(acc.Id).Phone +' new Phone number '+ acc.Phone;
            }
        }
    }
    
    public static void afterAccountUpdate(List<Account> accList, Map<Id,Account> accListMap){
        Map<Id,Account> accountsMap = new Map<Id,Account>();
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                accountsMap.put(acc.Id,acc);
            }
        }
        if(accountsMap.size()>0){
            for(Contact con : [SELECT Id,Phone,AccountId from Contact where AccountId IN: accountsMap.keySet()]){
                if(accountsMap.containsKey(con.AccountId)){
                    con.Phone = accountsMap.get(con.AccountId).Phone;
                    conList.add(con);
                }     
            }
        }
        if(conList.size()>0){
            update conList;
        }  
    }
    
    public static void beforeAccountDelete(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError('You Cannot delete Active Account');
            }
        }
    }
    
    public static void afterAccountDelete(Map<Id,Account> accListMap){
        List<Contact> conList = new List<Contact>();
        
        for(Contact con : [SELECT Id,Phone,AccountId from Contact where AccountId IN: accListMap.keySet()]){
            conList.add(con);
        }
        delete conList;
    }
    
    public static void afterAccountUndelete(List<Account> accList){
        
        List<Account> accounts = new List<Account>();
        for(Account acc : accList){
            Account accos = new Account();
            accos.Id = acc.Id;
            accos.Name = acc.Name;
            accos.Active__c = 'Yes';
            accounts.add(accos);
        }
        update accounts;
    }

}