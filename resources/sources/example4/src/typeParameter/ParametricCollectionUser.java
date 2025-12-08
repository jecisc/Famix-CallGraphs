package typeParameter;

import java.util.Collection;

public class ParametricCollectionUser {
    private ParametriCollection<SimpleObject> collection;

    public ParametriCollection<SimpleObject> getCollection() {
        if (collection == null) {
            collection = new ParametriCollection<>() {
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
