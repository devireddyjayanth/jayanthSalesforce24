@isTest
public class BeforeDeleteRecordTest {
    
    @isTest
    public static void deforeDeleteRecord(){
        List<Account> accList = new List<Account>();
        for(Integer i =0 ; i<=3 ;i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        delete accList;
        Test.stopTest();
        
                 
    }

}