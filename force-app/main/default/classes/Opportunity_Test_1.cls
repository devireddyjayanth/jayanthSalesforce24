@isTest
public class Opportunity_Test_1 {
    
    @testSetup
    static void create(){
        Opportunity opp = new Opportunity();
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.Name = 'Testing';
        insert opp;
    }
    
    @isTest
    static void testMe(){
        Opportunity op =[select id,StageName,CloseDate from Opportunity];
        op.StageName = 'Closed Won';
        update op;
        
        Opportunity myop = [Select Id,CloseDate from Opportunity where id=:op.Id];
        System.assertEquals(System.today(), myop.CloseDate);
    }
}