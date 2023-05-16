public class AccountHelperClass {
    
    public static void beforeInsertAccountRecords(List<Account> accList){
        
        for(Account acc : accList){
            acc.Active__c ='No';
            acc.Rating = 'Hot';
            acc.AnnualRevenue =100000;  
        }
    }
    
    public static void afterInsertAccountRecords(List<Account> accList){
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
    
    public static void beforeUpdatetAccountRecords(List<Account> accList, Map<Id,Account> accListMap){
        
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                acc.Description = 'Old Phone Number '+ accListMap.get(acc.Id).Phone + ' new Phone Number is '+ acc.Phone;
            }
        }
        
    }
    
    public static void afterUpdatetAccountRecords(List<Account> accList, Map<Id,Account> accListMap){
        
        Map<Id,Account> accountesMap = new Map<Id,Account>();
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            if(acc.Phone != null && acc.Phone != accListMap.get(acc.Id).Phone){
                accountesMap.put(acc.Id,acc);
            } 
        }
        if(accountesMap.size()>0){
            for(Contact con : [SELECT Id,Phone,AccountId from Contact where AccountId IN: accountesMap.keySet()]){
                if(accountesMap.containsKey(con.AccountId)){
                    con.Phone = accountesMap.get(con.AccountId).Phone;
                    conList.add(con);
                }
            }
        }
        if(accList.size()>0){
            update conList;
        }   
    }
    
    public static void beforeDeleteAccountRecords(List<Account> accList){
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError('You cannot delete Active Account');
            }
        }
        
    }
    

}