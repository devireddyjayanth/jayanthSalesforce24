@isTest
public class AccountHealperClassTest {
    
    @isTest
    public static void createOppRecordTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TR-Jan-30 '+i;
            opp.Amount = 40000;
            opp.CloseDate =System.today()+2;
            opp.StageName = 'Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Opportunity> oppos = [SELECT Id,description from Opportunity where Id =: oppList[0].Id];
        System.assertEquals('Hot Opportunity', oppos[0].description);
    }
}