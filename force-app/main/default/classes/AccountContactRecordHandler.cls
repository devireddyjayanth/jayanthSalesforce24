public class AccountContactRecordHandler {
    
    public static void accountContactCreation(List<Account> accList){
        List<Contact> conList = new List<Contact>();
            for(Account acc : accList){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.FirstName = 'Test Fname';
                con.LastName = 'Test LName'+acc.Name;
                conList.add(con);
            }
            insert conList;
        }
}