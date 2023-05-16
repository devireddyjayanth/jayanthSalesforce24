public class QueueableApex1 implements Queueable{

    public void execute(QueueableContext qc){
        
        List<Account> accList = [SELECT Id,Name,Phone from Account limit 2];
        for(Account acc : accList){
            acc.Phone = '0099887766';
        }
        update accList;
    }

}