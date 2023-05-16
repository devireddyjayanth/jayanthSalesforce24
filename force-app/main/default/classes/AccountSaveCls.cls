public class AccountSaveCls {
    
    public Account accObj{set;get;}
    
    public AccountSaveCls(){
        accObj = new Account();
    }
    public PageReference saveAccount(){
        insert accObj;
        return new PageReference('/'+accObj.Id);
    }
}