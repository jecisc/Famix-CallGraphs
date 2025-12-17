class C extends A {

    @Override
    public String m() {
        return this.toString() + "2";
    }

    @Override
    public String toString() {
        return "Hello2";
    }

    /*
    * We are overriding and updating the name of a parameter to ensure we do not take the parameter name into account during the resolution
     */
    @Override
    public String m2(String otherName) {
        return super.m2(otherName) + "2";
    }
}