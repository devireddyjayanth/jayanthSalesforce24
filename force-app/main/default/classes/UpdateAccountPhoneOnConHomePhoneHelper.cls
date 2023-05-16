public class UpdateAccountPhoneOnConHomePhoneHelper {
    
    public static void copyBillingAddressToMillingAddress(Map<Id,Account> accnewMap,Map<Id,Account> accoldMap){
        List<Id> accIds = new List<Id>();
        List<Contact> contacts = new List<Contact>();
        
        for(Id Ids : accnewMap.keySet()){
            Account newRec = accnewMap.get(Ids);
            Account oldRec = accoldMap.get(Ids);
            if(newRec.BillingCountry != oldRec.BillingCountry || newRec.BillingCity != oldRec.BillingCity || newRec.BillingState != oldRec.BillingState || newRec.BillingStreet != oldRec.BillingStreet ){
                accIds.add(newRec.Id);
            }
        }
        if(accIds.size()>0){
            List<Contact> conList = [SELECT Id,AccountId from Contact where AccountId =: accIds];
            for(Contact con : conList){
                con.MailingCountry = accnewMap.get(con.AccountId).BillingCountry;
                con.MailingCity = accnewMap.get(con.AccountId).BillingCity;
                con.MailingState = accnewMap.get(con.AccountId).BillingState;
                con.MailingStreet = accnewMap.get(con.AccountId).BillingStreet;
                contacts.add(con);
            }
            update contacts;
        }      
    }
}