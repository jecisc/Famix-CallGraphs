package constructor;

public class B {

    String b;

    public String initB() {
        return "b";
    }

    B() {
        b = this.initB();
    }

    public String printString() {
        return this.b;
    }
}
