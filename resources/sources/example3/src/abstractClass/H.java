package abstractClass;

public abstract class H {

    abstract public String methodA();

    public String methodB(){
        return "Hello" + this.methodA();
    }

    abstract public String methodC();

    public String methodD(){
        return "Hello" + this.methodC();
    }

    abstract public String methodE();

    public String methodF(){
        return "Hello" + this.methodE();
    }
}
