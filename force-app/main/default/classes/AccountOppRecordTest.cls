@isTest
public class AccountOppRecordTest {
    
    @isTest
    public static void oppRecordCreation(){
        List<Account> accList = new List<Account>();
        for(Integer i=0 ;i <=3 ;i++){
            Account acc = new Account();
            acc.Name = 'Test=DJR-31 '+i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Opportunity> oppos = [Select Id,Name from Opportunity where accountId =: accList[0].Id];
        System.assertEquals('Test-Jan-31', oppos[0].Name);
    }

}