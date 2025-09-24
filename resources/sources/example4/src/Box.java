public class Box<T> {
    // T is the *type parameter* – whatever type the user supplies
    private T value;

    public Box(T value) {
        this.value = value;
    }

    public T get() {
        return value;
    }

    public void set(T value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Box holding: " + value;
    }
}