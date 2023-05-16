@isTest
public class AccountBillingToShippingHandlerClassTest {
    
    @isTest
    public static void copyBillingToShippingAddress(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<=3;i++){
            Account acc = new Account();
            acc.Name = 'TR-Jan-31-01'+i;
            acc.BillingCity = 'TestCity';
            acc.BillingCountry = 'TestCountry';
            acc.BillingPostalCode = '1234';
            acc.BillingState = 'TestState';
            acc.CopyBillingToShipping__c = true;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> accou = [SELECT Id,ShippingCity from Account where Id =: accList[0].Id];
        System.assertEquals('TestCity', accou[0].ShippingCity);
        
    }

}