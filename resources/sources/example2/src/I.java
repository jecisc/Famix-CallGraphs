public interface I {
    
    default String a() {
        return "Hello";
    }

    String b();

}