/**
 * Simple driver that exercises the {@link Operation} enum.
 * Run it with:  java com.example.Main
 */
public class Main {

    public static void main(String[] args) {
        // Hard‑coded sample data
        int a = 12;
        int b = 4;

        // Direct enum method calls
        System.out.println("Direct enum calls:");
        System.out.printf("%d + %d = %d%n", a, b, Operation.ADD.apply(a, b));
        System.out.printf("%d - %d = %d%n", a, b, Operation.SUBTRACT.apply(a, b));
        System.out.printf("%d * %d = %d%n", a, b, Operation.MULTIPLY.apply(a, b));
        System.out.printf("%d / %d = %d%n", a, b, Operation.DIVIDE.apply(a, b));

        // Calls via the static helper
        System.out.println("\nCalls via Operation.execute(...):");
        System.out.printf("%d + %d = %d%n", a, b, Operation.execute("+", a, b));
        System.out.printf("%d - %d = %d%n", a, b, Operation.execute("-", a, b));
        System.out.printf("%d * %d = %d%n", a, b, Operation.execute("*", a, b));
        System.out.printf("%d / %d = %d%n", a, b, Operation.execute("/", a, b));

        // Demonstrate exception handling (optional)
        try {
            Operation.execute("/", a, 0);
        } catch (ArithmeticException ex) {
            System.out.println("\nCaught expected exception: " + ex.getMessage());
        }

        // Print a single direction
        Directions.EAST.print();          // → EAST

        // Print every direction
        System.out.println("All directions:");
        Directions.printAll();
    }
}