@isTest
public class AccountTeamTriggerTest {
    
    @isTest
    public static void accountTeamTest(){
        User u = [SELECT Id from User where alias ='sub'];
        Account acc = new Account();
        acc.Industry = 'Education';
        acc.Name='Test';
        acc.AnnualRevenue = 2000000;
        
        try{
            insert acc;
        }catch(Exception e){
            System.debug(e);
        }
        
        AccountTeamMember atm = [SELECT userId,AccountId,AccountAccessLevel from AccountTeamMember where AccountId =: acc.Id];
        if(acc.Industry =='Education' && acc.AnnualRevenue >= 100000){
            System.assertEquals(atm.UserId, u.Id);
            System.assertEquals(atm.AccountAccessLevel, 'Edit');
            //System.assertEquals(atm.TeamMemberRole, 'Account Manager');
        }
        
        
    }
    
    
}