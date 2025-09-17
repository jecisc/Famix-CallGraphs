import constructor.B;
import constructor.C;
import signature.A;

public class Main {
    public static void main(String[] args) {
        A a =  new A();
        System.out.println(a.m());
        System.out.println(a.m("a"));

        B b = new C("Test");
        System.out.println(b.printString());
    }
}