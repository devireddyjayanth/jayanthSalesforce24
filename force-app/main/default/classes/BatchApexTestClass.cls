@isTest
public class BatchApexTestClass {
    
    @isTest
    public static void batchApexTestClasses(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0 ; i<=3 ; i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            accList.add(acc);
        }
        insert accList;
        
        Test.startTest();
        BatchApexEx1 b1 = new BatchApexEx1();
        Id JobIds = Database.executeBatch(b1);
        Test.stopTest();
        
        
        
        List<Account> accounts = [SELECT Id,Name from Account];
        System.assertEquals('Jayanth@', accounts[0].Name);
    }

}