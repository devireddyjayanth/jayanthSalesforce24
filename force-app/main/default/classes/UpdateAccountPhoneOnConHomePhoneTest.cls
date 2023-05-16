@isTest
public class UpdateAccountPhoneOnConHomePhoneTest {
    
    @isTest
    Public static void accountContactMailingAddress(){
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        
        for(Integer i = 1; i <= 5; i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            acc.BillingCountry = 'TestCountry';
            acc.BillingCity = 'Test City';
            acc.BillingPostalCode = '123456';
            acc.BillingState = 'TestState';
            acc.BillingStreet = 'TestStreet';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        for(Account acc : accList){
            Contact con = new  Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        insert conList;
        for(Account accos : accList){
            accos.BillingCity = 'HYD';
        }
        update accList;
        test.stopTest();
        
        
        List<Contact> cons = [SELECT Id,MailingCity from Contact where Id =:conList[0].Id];
        
        System.assertEquals('HYD',cons[0].MailingCity);
    }
    
    
    
}