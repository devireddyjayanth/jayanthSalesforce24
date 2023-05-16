@isTest
public class AccountTriggerJan11Test {
    
    @isTest
    public static void testMe(){
        Account acc = new Account();
        acc.Name = 'Testing';
        insert acc;
  
        Account ac = [select Id,Name,Rating,Ownership,Phone from Account where id=:acc.Id];
        System.debug('Rating : '+ ac.Rating);
        System.assertEquals('Warm', ac.Rating);
        System.debug('Phone : '+ ac.Phone);
        System.assertEquals('98765', acc.Phone);
        
    }
    
}