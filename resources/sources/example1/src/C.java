class C extends A {

    @Override
    public String m() {
        return this.toString() + "2";
    }

    @Override
    public String toString() {
        return "Hello2";
    }
}