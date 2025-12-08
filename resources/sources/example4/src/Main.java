import simple.Box;
import simple.Util;
import typeParameter.ParametricCollectionUser;
import typeParameter.SimpleObject;

public class Main {
    public static void main(String[] args) {
        Box<Integer> intBox = new Box<>(42);
        intBox.set(100);
        System.out.println(intBox.get());

        System.out.println("First number: " + Util.first(new Integer[]{1, 2, 3, 4}));

        Box<? extends Number> numBox = new Box<>(3.14);
        System.out.println(numBox);

        //ParametricCollectionUser user = new ParametricCollectionUser();
        //user.getCollection().method3(new SimpleObject());
        //System.out.println(user.getCollection());
    }
}