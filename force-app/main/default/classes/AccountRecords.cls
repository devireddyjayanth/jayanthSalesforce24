public class AccountRecords {
    public List<Account> accList{set;get;}
    public AccountRecords(ApexPages.StandardController stdController){
        accList = new List<Account>();
        this.accList = [select Id,name,type,rating from Account limit 10];
    }
}