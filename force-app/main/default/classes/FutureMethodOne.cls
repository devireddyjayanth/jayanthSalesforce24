public class FutureMethodOne {
    
    public FutureMethodOne(){
        takeShower();
        haveBreakFast();
        carServesing();
        movieWithFriend();
    }
    
    public static void takeShower(){
        System.debug('I am Taking shower');
    }
    
    public static void haveBreakFast(){
        System.debug('I had BreakFast');
    }
    
    @future
    public static void carServesing(){
        System.debug('Car is being repaired');
    }
    
    public static void movieWithFriend(){
        System.debug('I am on Movie');
    }

}