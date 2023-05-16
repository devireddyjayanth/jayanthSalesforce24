public class QueubaleApexEx2 implements Queueable {
    public void execute(QueueableContext con){
        System.debug('This is Job-2');
        delete [SELECT Id from Contact LIMIT 2];
    }
}