class C extends A {
    String m() {
        return "Hello2";
    }

    public static void main(String[] args) {
        A a = new A();
        B b = new B();
        String s;

        s = a.m();
        s = b.m();
        System.out.println("Done");
    }
}