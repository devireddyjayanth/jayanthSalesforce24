public class ContactEmailHelper {
    
    public static void contactEmailhelp(List<Contact> conList){
        for(Contact con : conList){
            if(con.AccountId != null){
                for(Account acc : [SELECT Id,Email__c from Account where Id =: con.AccountId]){
                    con.Email = acc.Email__c;
                }
            }
        }
    }

}