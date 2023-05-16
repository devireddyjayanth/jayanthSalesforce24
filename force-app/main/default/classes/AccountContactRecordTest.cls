@isTest
public class AccountContactRecordTest {
    
    @isTest
    public static void createAccountContact(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i<=3 ;i++){
            Account acc = new Account();
            acc.Name = 'Test';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Contact> conList = [SELECT Id from Contact where accountId =: accList[0].Id];
        System.assert(conList!=null, 'Contact is not created');
        
        List<Contact> conList1 = [SELECT Id, FirstName from contact where accountId =: accList[0].Id];
        System.assertEquals('Test Fname', conList1[0].FirstName);
    }

}