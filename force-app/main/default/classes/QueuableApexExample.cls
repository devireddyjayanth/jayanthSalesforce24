public class QueuableApexExample implements Queueable {
    
    public void execute(QueueableContext qc){
        List<Account> accList = new List<Account>();
        Account a = new Account(name='B.Vamsi',Phone='7788997890',rating='Hot');
        accList.add(a);
        insert accList;
    }

}