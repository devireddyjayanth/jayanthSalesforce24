public class ContactApexHelper {
    
    public static void countingMethod(List<Contact> newConList, List<Contact> oldConList){
        
        Set<Id> conIds = new Set<Id>();
        
        if(newConList != null){
            for(Contact con : newConList){
                if(con.AccountId != null){
                    conIds.add(con.AccountId);
                }
            }
        }
        
        if(oldConList != null){
            for(Contact con : oldConList){
                if(con.AccountId != null){
                    conIds.add(con.AccountId);
                }
            }
        }
        
        List<Account> accList = [SELECT Id,Total_Contacts__c,(SELECT Id from Contacts) from Account where Id IN: conIds];
        if(accList.size()>0){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.contacts.size();
            }
        }
        update accList;
        
    }
}