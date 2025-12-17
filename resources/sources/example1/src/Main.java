public class Main {
    public static void main(String[] args) {
        A a = new A();
        B b = new B();
        String s;

        s = a.m();
        s = b.m();
        System.out.println(s);

        C c = new C();
        c.m2("Hello");

        E e = new E();
        System.out.println(e.getE());
    }
}
