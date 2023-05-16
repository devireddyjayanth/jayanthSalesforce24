public class AccountControllerTwo {
    
    public List<Account> accList{set; get;}
    
    public AccountControllerTwo(ApexPages.StandardController sv){
        accList = new List<Account>();
        this.accList = [SELECT Id,Name,Phone from Account limit 10];
    }

}