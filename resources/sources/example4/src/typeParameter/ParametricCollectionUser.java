package typeParameter;

public class ParametricCollectionUser {
    private ParametricCollectionSubclass<SimpleObject> collection;

    public ParametricCollectionSubclass<SimpleObject> getCollection() {
        if (collection == null) {
            collection = new ParametricCollectionSubclass<>() {
                @Override
                public void method1(SimpleObject e) {
                    e.getHello();
                }

                @Override
                public void method2(SimpleObject var, SimpleObject var2) {
                    var.getHello();
                    var2.getHello();
                }

            };
        }
        return collection;
    }
}
