package typeParameter;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

public abstract class ParametriCollection<T> extends AbstractSet<T> {
    private final Set<T> values = new LinkedHashSet<>();

    public boolean method3(T value) {
        this.method2(value, new SimpleObject());
        return values.add(value);
    }

    @Override
    public Iterator<T> iterator() {
        final Iterator<T> it = this.values.iterator();
        return new Iterator<>() {
            T current;

            public boolean hasNext() {
                return it.hasNext();
            }

            public T next() {
                return this.current = it.next();
            }

            public void remove() {
                it.remove();
                ParametriCollection.this.method1(this.current);
            }
        };
    }

    @Override
    public int size() {
        return values.size();
    }

    public abstract void method1(T var);

    public abstract void method2(T var, SimpleObject var2);

}
