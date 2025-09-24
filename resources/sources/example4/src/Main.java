public class Main {
    public static void main(String[] args) {
        // ----- Box<Integer> -----
        Box<Integer> intBox = new Box<>(42);
        System.out.println(intBox);                // Box holding: 42
        intBox.set(100);
        System.out.println(intBox.get());           // 100

        // ----- Box<String> -----
        Box<String> strBox = new Box<>("hello");
        System.out.println(strBox);                 // Box holding: hello

        // ----- Generic static method -----
        Integer[] numbers = {1, 2, 3, 4};
        String[] words   = {"alpha", "beta", "gamma"};

        Integer firstNumber = Util.first(numbers); // inferred as Integer
        String  firstWord   = Util.first(words);   // inferred as String

        System.out.println("First number: " + firstNumber); // 1
        System.out.println("First word: "   + firstWord);   // alpha

        // ----- Bounded type parameter example -----
        // Only Number (or subclasses) are allowed
        Box<? extends Number> numBox = new Box<>(3.14);
        System.out.println(numBox); // Box holding: 3.14
    }
}