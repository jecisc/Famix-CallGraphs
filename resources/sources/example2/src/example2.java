interface I {
    default String a(){
        return "Hello";
    }

    String b();

}

class C implements I {

    public String b() {
            return "World";
        }
    
}

class Main {
    public static void main() {
        C c = new C();
        c.a();
        c.b();
    }
}