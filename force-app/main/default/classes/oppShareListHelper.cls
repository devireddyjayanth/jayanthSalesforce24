public class oppShareListHelper {
    
    public static void caseShareRecords(List<Case> caseList){
        List<CaseShare> cse = new List<CaseShare>();
        User u=[select id from User where alias='sub'];
        for(Case cs : caseList){
            CaseShare c = new CaseShare();
            c.CaseId = cs.Id;
            c.UserOrGroupId = u.Id;
            c.RowCause = 'Manual';
            c.CaseAccessLevel = 'Edit';
        }   
    }
}