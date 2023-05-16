public class CaseHelperClass {
    
    public static void caseStatus(List<Case> caseList){

        for(Case cs : caseList){
            if(cs.Status =='Escalated' && cs.Description == null){
                cs.addError('Record should not save');
            }
        }
        
    }

}