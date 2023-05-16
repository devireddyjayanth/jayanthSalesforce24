public class ScheduleApexEx1 implements Schedulable{
    
    public void execute(SchedulableContext sc){
        List<Account> accList = [SELECT Id,Name,Phone from Account limit 2];
        
        for(Account acc : accList){
            acc.Phone = '8800990091';
        }
        update accList;
    }

}