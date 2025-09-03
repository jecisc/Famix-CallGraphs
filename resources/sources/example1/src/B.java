public class B extends A {

    public B(){
        this.initialize();
        this.initialize2();
    }

    public String m() {
        return "Hello";
    }

    private void initialize() {
        System.out.println("init");
    }

    private void initialize2(){
        System.out.println("init2");
    }

}