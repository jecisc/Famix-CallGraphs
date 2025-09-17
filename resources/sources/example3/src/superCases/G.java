package superCases;

public class G extends E {
    @Override
    public String method2() {
        return "G";
    }

    @Override
    public String method1() {
        return super.method2() + "G";
    }
}
