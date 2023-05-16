@isTest
public class BatchApex1TestClass {
    
    @isTest
    public static void batchApexTest(){
        List<Account> accList = new List<Account>();
        for(Integer i = 1 ; i<=4 ; i++){
            Account acc = new Account();
            acc.Name = 'DJR-Test '+i;
            acc.Phone = '000000';
            accList.add(acc);
        }
        Test.startTest();
        Insert accList;
        
        BatchApex1 bx = new BatchApex1();
        Database.executeBatch(bx, 10);
        
        Test.stopTest();
        
        List<Account> accountList = [SELECT Id,Name,Phone from Account];
        
        System.assertEquals('990099002', accountList[0].Phone);
    }
    
}