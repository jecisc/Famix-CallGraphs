public enum Directions {

    NORTH,
    EAST,
    SOUTH,
    WEST;

    /** Prints the name of *this* direction. */
    public void print() {
        // `name()` returns the identifier used for the enum constant
        System.out.println(name());
    }

    /** Prints all directions, one per line. */
    public static void printAll() {
        for (Directions d : Directions.values()) {
            d.print();          // re‑uses the same `print()` implementation
        }
    }
}