public class QueubaleApexEx1 implements Queueable{
    
    public void execute(QueueableContext qc){
        System.debug('This is Job 1');
        delete [SELECT Id from Account LIMIT 3];
        System.enqueueJob(new QueubaleApexEx2());
        
    }

}