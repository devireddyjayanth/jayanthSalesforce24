public class AccountBillingToShippingHandlerClass {
    
    public static void createRecordsBillingToShipping(List<Account> accList){
        for(Account acc : accList){
                if(acc.CopyBillingToShipping__c == true){
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingCountry = acc.BillingCountry;
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                    acc.ShippingState = acc.BillingState;
                    acc.ShippingStreet = acc.BillingStreet;
                }
            }
        
    }

}