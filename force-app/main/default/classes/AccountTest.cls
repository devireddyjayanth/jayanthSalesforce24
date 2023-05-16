@isTest
public class AccountTest {
    
    @isTest
    public static void beforeInsertTest(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0 ; i<=4 ; i++ ){
            Account acc = new Account();
            acc.Name = 'Tiru-12 '+i;
            acc.Phone = '0099880099';
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id,Name,Rating,Phone,Active__c from Account where Id =: accList[0].Id];
        System.assertEquals('No', accounts[0].Active__c);
        
    }

}