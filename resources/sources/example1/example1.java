class A extends Object {
    String m() {
        return (this.toString());
    }
}

class B extends A {
    String m() {
        return "Hello";
    }
}

class C extends A {
    String m() {
        return "Hello2";
    }

    public static void main() {
        A a = new A();
        B b = new B();
        String s;

        s = a.m();
        s = b.m();
    }
}