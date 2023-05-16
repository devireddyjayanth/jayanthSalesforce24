public class CountSumannualRevenueInAccHelper {
    
    public static void countTotalAnnualRevenue(Map<Id,Contact> newMap,Map<Id,Contact> oldMap){
        
        Set<Id> accId = new SEt<Id>();
        List<Account> accList = new List<Account>();
        System.debug('Step-1');
        for(Id conId : newMap.keySet()){
            System.debug('Step-2');
            Contact newCon = newMap.get(conId);
            Contact oldCon = oldMap.get(conId);
            if(newCon.Amount__c != null && oldCon.Amount__c != newCon.Amount__c){
                System.debug('Step-3');
                accId.add(newCon.AccountId);
                System.debug('AccountId +: '+newCon.AccountId);
                //Account a = new Account();
                //a.AnnualRevenue
            }
        }
        if(accId.size()>0){
            System.debug('Step-4');
            List<Account> acc = [SELECT Id,AnnualRevenue,(SELECT Id,Amount__c from contacts) from Account where Id IN: accId];
            for(Account ac : acc){
                System.debug('Step-5');
                Decimal total = 0;
                for(Contact ca : ac.Contacts){
                    total = total+ca.Amount__c;
                    System.debug('Step-6');
                    System.debug('Total '+total+ca.Amount__c);
                    
                }
                ac.AnnualRevenue = total;
                accList.add(ac);
            }
            update accList;
        }
        
    }

}