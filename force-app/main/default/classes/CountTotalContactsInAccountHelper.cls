public class CountTotalContactsInAccountHelper {
    
    Public static void afterInsertContactRecords(Map<Id,contact> newcontact, Map<Id,contact> oldcontact){
        set<id> accIds= new set<id>();
        
        if(newcontact != null){
            for(Id conIds : newcontact.KeySet()){
                Contact newRec = newcontact.get(conIds);
                if(newRec.AccountId != null){
                    accIds.add(newRec.AccountId);
                }
            }
        }
        if(oldcontact != null){
            for(Id conIds : oldcontact.keySet()){
                Contact oldRec = oldcontact.get(conIds);
                if(oldRec.AccountId != null){
                    accIds.add(oldRec.AccountId);
                }
            }
        }
        
         
        List<Account> accList = [Select Id,Total_Contacts__c, (Select id from Contacts) from Account where Id IN :accIds];
         
        if(accList!=null){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
            } 
        }
         
        if(!accList.isEmpty()){
            update accList;
        }
    } 
    
}