@isTest
public class CountCaseAnAccountTest {
    
    @isTest
    public static void testCountCase(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc = new Account(Name='Test '+i);
            accList.add(acc);
        }
        insert accList;
        
        List<Case> caseList = new List<Case>();
        List<Id> accIds = new List<Id>();
       
        for(Account acs : accList){
            accIds.add(acs.Id);
            for(Integer i = 0;i<3;i++){
                Case cs = new Case();
                cs.Status = 'New';
                cs.Origin = 'Phone';
                cs.AccountId = acs.Id;
                caseList.add(cs);
            }
            for(Integer i = 0;i<3;i++){
                Case cs = new Case();
                cs.Status = 'New';
                cs.Origin = 'Web';
                cs.AccountId = acs.Id;
                caseList.add(cs);
            }
            for(Integer i=0;i<3;i++){
                Case cs = new Case();
                cs.Status = 'New';
                cs.Origin = 'Email';
                cs.AccountId = acs.Id;
                caseList.add(cs);
            }
        }
        insert caseList;
        
        Test.startTest();
        CountCaseAnAccount.countCasesfromAccountId(accIds);
        Test.stopTest();
        
        
        List<Account> updatedAccounts = new List<Account>();
        updatedAccounts = [select Id,Case_Through_Email__c,Case_Through_Phone__c,Case_Through_Web__c from Account where Id IN: accIds];
        System.assertEquals(3, updatedAccounts[0].Case_Through_Email__c);
        System.assertEquals(3, updatedAccounts[0].Case_Through_Phone__c);
        System.assertEquals(3, updatedAccounts[0].Case_Through_Web__c);
        
        
    }
}