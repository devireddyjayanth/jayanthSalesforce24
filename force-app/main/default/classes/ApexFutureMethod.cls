public class ApexFutureMethod {
    
    @future
    public static void method1(){
        System.debug('Call Me One');
        System.debug('Call Me Two');
    }
    
    @future
    public static void method2(){
        System.debug('Video 1');
        System.debug('Video 2');
    }
    
    public static void method3(){
        System.debug('Show One');
        method1();
        System.debug('Show Two');
        method2();
        System.debug('Show Three');
        
    }
    

}