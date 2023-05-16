@isTest
public class Apex_trigger_Exmple1_Test {
    
    @isTest
    public static void testMe(){
        Account accs = new Account();
        accs.Name ='TestingTrigger1';
        insert accs;
        
        List<Account> ac= [select Id,Rating,Industry,Phone from Account where Id =: accs.Id];
        for(Account acc : ac){
            System.assertEquals('Banking',acc.Industry);
            System.assertEquals('Hot', acc.Rating);
            System.assertEquals('040-9988', acc.Phone);
        }
        
    }
}