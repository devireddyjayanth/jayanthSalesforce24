public class ContactEmailCopyHelper {
    
    public static void contactEmailCopy(List<Contact> conList){
        
        for(Contact con : conList){
            if(con.AccountId != null){
                for(Account acc : [SELECT Id,Email__c from Account where Id =: con.AccountId]){
                    con.Phone = acc.Phone;
                }
            }
        }
        
    }

}