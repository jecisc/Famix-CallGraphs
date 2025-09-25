import abstractClass.H;
import abstractClass.J;
import constructor.B;
import constructor.C;
import signature.A;
import superCases.D;
import superCases.F;
import superCases.G;

public class Main {
    public static void main(String[] args) {
        A a =  new A();
        System.out.println(a.m());
        System.out.println(a.m("a"));

        B b = new C("Test");
        b.printString();

        D d = new D();
        D f = new F();
        D g = new G();
        d.method1();
        f.method1();
        g.method2();

        H h = new J();
        h.methodA();
        h.methodB();
        h.methodD();
        h.methodF();
    }
}