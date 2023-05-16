public class futureMethod1 {
    
    @future
    public static void method1(){
        System.debug('method-1'); 
    }
    
    @future
    public static void method2(){
        System.debug('method-2');
    }
    
    public static void method3(){
        System.debug('Method-3-1');
        method1();
        System.debug('Method-3-2');
        method2();
        System.debug('Method-3-3');
    }

}