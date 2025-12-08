import simple.Box;
import simple.Util;
import typeParameter.ParametricCollectionUser;
import typeParameter.SimpleObject;

public class Main {
    public static void main(String[] args) {
        Box<Integer> intBox = new Box<>(42);
        System.out.println(intBox);
        intBox.set(100);
        System.out.println(intBox.get());

        Box<String> strBox = new Box<>("hello");
        System.out.println(strBox);

        Integer[] numbers = {1, 2, 3, 4};
        String[] words   = {"alpha", "beta", "gamma"};

        Integer firstNumber = Util.first(numbers);
        String  firstWord   = Util.first(words);

        System.out.println("First number: " + firstNumber);
        System.out.println("First word: "   + firstWord);

        Box<? extends Number> numBox = new Box<>(3.14);
        System.out.println(numBox);

        ParametricCollectionUser user = new ParametricCollectionUser();
        user.getCollection().method3(new SimpleObject());
        System.out.println(user.getCollection());
    }
}