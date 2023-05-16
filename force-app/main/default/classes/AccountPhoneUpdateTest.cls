@isTest
public class AccountPhoneUpdateTest {
    
    @isTest
    public static void updateRecords(){
        List<Account> accList = new List<Account>();
        for(Integer i=0 ; i<=4 ; i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            acc.Phone = '99887766';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        for(Account acc : accList){
            acc.Phone = '11223344';
        }
        update accList;
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id,Phone from Account where Id =: accList[0].Id];
        System.assertEquals('1122334', accounts[0].Phone);
    }
}