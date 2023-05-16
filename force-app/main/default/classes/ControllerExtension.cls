public class ControllerExtension {

    public List<Account> accList{set;get;}
    
    public ControllerExtension(ApexPages.StandardController ap){
        accList = new List<Account>();
        this.accList = [SELECT Id,Name from Account limit 10];
    }
}