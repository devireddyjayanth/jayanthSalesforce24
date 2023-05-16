public class CopyBillingToShipping {
    
    public static void copyBillingToShipping(List<Account> newMap,Map<Id,Account> oldMap){
        
        for(Account acc : newMap){
            if((oldMap == null && acc.CopyBillingToShipping__c) || (acc.CopyBillingToShipping__c != oldMap.get(acc.Id).CopyBillingToShipping__c)){
                
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    public static void populateRatingOnAccount(List<Account> newMap,Map<Id,Account> oldMap){
        for(Account acc : newMap){
            if((acc.Industry == 'Media' && acc.Industry != null && oldMap != null) || 
               (acc.Industry == 'Media' && acc.Industry != null && acc.Industry != oldMap.get(acc.Id).Industry)){
                   
                   acc.Rating = 'Hot';
                
            }
        }
        
    }

}