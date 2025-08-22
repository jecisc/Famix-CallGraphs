import conflict_superclass_implementation.Q;
import implementation.E;
import inheritance.C;
import inheritance.D;
import inheritance_implementation.F;
import multiple_inheritance_and_implementations.L;
import simple.A;
import simple_override.H;
import stub.M;
import superclass_and_implemntation_implements.O;

public class Main {
    public static void main(String[] args) {
        A a = new A();
        System.out.println(a.a());
        C c = new C();
        System.out.println(c.b());
        D d = new D();
        System.out.println(d.b());
        E e = new E();
        System.out.println(e.i());
        F f = new F();
        System.out.println(f.i());
        H h = new H();
        System.out.println(h.g());
        L l = new L();
        System.out.println(l.l());
        M m = new M();
        System.out.println(m.toString());
        O o = new O();
        System.out.println(o.o());
        Q q = new Q();
        System.out.println(q.q());
    }
}