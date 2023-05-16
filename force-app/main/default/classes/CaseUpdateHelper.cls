public class CaseUpdateHelper {
    
    public static void caseUpdate(List<Case> newVal, Map<Id,Case> oldVal){
        for(Case cs : newVal){
            if(cs.Status == 'Escalated' && oldVal.get(cs.Id).Status == 'New'){
                cs.addError('You Cannot modify records');
            }
        }
        
    }

}