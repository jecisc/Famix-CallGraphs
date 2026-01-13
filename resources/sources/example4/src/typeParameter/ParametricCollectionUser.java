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

                /*
                 * We are overriding and updating the name of a parameter to ensure we do not take the parameter name into account during the resolution
                 */
                @Override
                public void method2(SimpleObject otherVarName, SimpleObject var2) {
                    otherVarName.getHello();
                    var2.getHello();
                }

            };
        }
        return collection;
    }
}
