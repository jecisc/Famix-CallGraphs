class Util {
    /**
     * Returns the first element of any array.
     * The method itself is generic – the compiler infers the type
     * from the argument you pass.
     */
    public static <E> E first(E[] array) {
        if (array == null || array.length == 0) {
            throw new IllegalArgumentException("Array must contain at least one element");
        }
        return array[0];
    }
}