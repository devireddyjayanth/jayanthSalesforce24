@isTest
public class LatestCaseNumberOnAccountTest {
    
    @isTest
    public static void populateLatestCaseNumberOnAcc(){
        List<Account> accList = new List<Account>();
        List<Case> caseList = new List<Case>();
        
        For(Integer i =0 ; i<=5 ; i++){
            Account acc = new Account();
            acc.Name = 'Test '+i;
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc : accList){
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.Status = 'New';
            cs.Origin= 'Phone';
            caseList.add(cs);
        }
        test.startTest();
        insert caseList;
        test.stopTest();
        
        List<Account> accounts = [SELECT Id,Latest_Case_Number__c from Account where Id =: accList[0].Id];
        
        List<Case> csaes = [SELECT Id,CaseNumber from Case where Id =: caseList[0].Id];
        System.assertEquals(csaes[0].CaseNumber, accounts[0].Latest_Case_Number__c);
    }
    
}