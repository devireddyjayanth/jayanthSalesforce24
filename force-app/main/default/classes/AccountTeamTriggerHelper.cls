public class AccountTeamTriggerHelper {
    
    public static void createNewAccountRecord(List<Account> accList){
        User u = [SELECT Id,alias from user where alias ='sub'];
        List<AccountTeamMember> teams = new List<AccountTeamMember>();
        for(Account acc : accList){
            if(acc.Industry == 'Education' && acc.AnnualRevenue >= 1000000){
                AccountTeamMember tm = new AccountTeamMember();
                tm.AccountId = acc.Id;
                tm.UserId = u.Id;
                tm.TeamMemberRole = 'Account Manager';
                tm.AccountAccessLevel = 'Edit';
                teams.add(tm);
            }
        }
        insert teams;
    }

}