public class B extends A {

    public B(){
        this.initializeFromConstructor();
    }

    static {
      initializeFromStaticInitializationBlock();
    }

    {
        initializeFromInitializationBlock();
    }

    public String m() {
        return "Hello";
    }

    private void initializeFromConstructor() {
        System.out.println("init");
    }

    private void initializeFromInitializationBlock(){
        System.out.println("init2");
    }

    static private void initializeFromStaticInitializationBlock(){
        System.out.println("init3");
    }

}