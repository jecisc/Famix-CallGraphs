public interface I {
    String method1();

    String method2();

    default String method3(){
        return "Interface" + method5();
    }

    default String method4(){
        return "Interface2";
    }

    String method5();

    default void method6(){
        // Nothing to do
    }
}
