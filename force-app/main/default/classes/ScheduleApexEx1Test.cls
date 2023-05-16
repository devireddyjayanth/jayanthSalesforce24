@isTest
public class ScheduleApexEx1Test {
    @isTest
    public static void testSchedule(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i<=3 ;i++){
            Account acc = new Account();
            acc.Name = 'Test-1';
            acc.Phone = '9900880011';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        ScheduleApexEx1 sa = new ScheduleApexEx1();
        String cronExp = '0 18 4 07 02 ?';
        System.schedule('djr@1', cronExp, sa);
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id,Name,Phone from Account limit 3];
        System.assertEquals('8800990091', accounts[0].Phone);
    }
    
}