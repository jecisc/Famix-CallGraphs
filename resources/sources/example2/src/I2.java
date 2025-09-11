public interface I2 extends I {

    @Override
    default String method2() {
        return "Interface3";
    }

    @Override
    default String method4(){
        return "Interface4";
    }
}
