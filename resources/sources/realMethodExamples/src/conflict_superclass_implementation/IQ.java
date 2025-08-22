package conflict_superclass_implementation;

public interface IQ {
    default String q() {
        return "Q";
    }
}
