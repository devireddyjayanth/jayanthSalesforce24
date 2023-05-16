public with sharing class Calculate2numbers {
    @AuraEnabled(cacheable=true)
    public static Integer getSumResult(Integer firstNumber, Integer secondNumber){
        try {
            return (firstNumber + secondNumber);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}