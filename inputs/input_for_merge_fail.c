int pure(int x) {
    return x;
}
int foo(int arg_1) {
    int a = 13 + arg_1;
    int b = pure(a+1);
    return b;
}
