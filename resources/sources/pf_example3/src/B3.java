package example3;

public class B3 extends A3 {

    private int count = 0;

    public static void main(String[] args) {
    	System.out.println("example3.B3.main(String[])");
        B3 b = new B3();

        b.method2();
    }

    public void method2(){
    	System.out.println("example3.B3.method2()");
        if (count < 2){
            count++;
            this.method1();
        } else{
            this.method3();
        }
    }

    public void method3(){
    	System.out.println("example3.B3.method3()");
    }
}