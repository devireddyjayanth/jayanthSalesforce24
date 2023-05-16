public class ContactCountHelper {
    
    public static void contactCount(List<Contact> newCon, List<Contact> oldCon){
        
        Set<Id> conIds = new Set<Id>();
        
        if(newCon != null){
            for(Contact con : newCon){
                if(con.AccountId != null){
                   conIds.add(con.AccountId); 
                }
            }
        }
        
        if(oldCon != null){
            for(Contact con : oldCon){
                if(con.AccountId != null){
                    conIds.add(con.AccountId);
                }
            }
        }
        
      
        
        List<Account> accList = [SELECT Id,Name,Total_Contacts__c,(SELECT Id from Contacts) from Account where Id IN: conIds];
        if(accList != null){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
            }
        }
		update accList;     
    }

}