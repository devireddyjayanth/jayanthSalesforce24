@isTest
public class QueueableApex1Test {
    
    @isTest
    public static void queueableEx1test(){
        
        
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test-1';
        acc.Phone = '0099009900';
        accList.add(acc);
        
        Test.startTest();
        insert accList;
        
        System.enqueueJob(new QueueableApex1());
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id,Name,Phone from Account]; 
        System.assertEquals('0099887766', accounts[0].Phone);
        
    }
    
}