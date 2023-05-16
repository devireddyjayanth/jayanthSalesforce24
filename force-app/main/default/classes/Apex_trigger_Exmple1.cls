public class Apex_trigger_Exmple1 {

    public static void invoke(List<Account> accList){
        for(Account acc : accList){
            acc.Industry = 'Banking';
            acc.Rating = 'Hot';
            acc.Phone = '040-9988';
        }
    }

}