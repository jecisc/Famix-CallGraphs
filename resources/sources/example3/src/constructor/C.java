package constructor;

public class C extends B {

    String c;
    String d;

    public C() {
        c = this.initC();
    }

    public C(String d) {
        this();
        this.d = d;
    }

    public String initC() {
        return "c";
    }

    public String toString() {
        return b + c + d;
    }
}
