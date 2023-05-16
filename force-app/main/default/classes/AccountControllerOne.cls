public class AccountControllerOne {
    public Account accobj{set;get;}
	
    Public AccountControllerOne(){
        accobj = new Account();
    }
    
    public PageReference saveAccount(){
        insert accobj;
        return new PageReference('/'+accobj.Id);
    }
}