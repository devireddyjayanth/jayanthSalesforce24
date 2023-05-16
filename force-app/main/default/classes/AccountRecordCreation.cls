@isTest
public class AccountRecordCreation {
    
    @isTest
    public static void recordCreationTest(){
        List<Account> accList = new List<Account>();
        for(Integer i = 1 ; i<=3 ; i++){
            Account acc = new Account();
            acc.Name = 'Test-Jan 30 '+i;
            acc.Industry = 'Energy';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> accounts = [Select Id,Rating from Account where Id =: accList[0].Id];
        
        System.assertEquals('Hot', accounts[0].Rating);
    }

}