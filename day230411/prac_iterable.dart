prac_iterable() {
  test2();
}

//実験１
// 意図的にエラーが発生させる
void test1() {
  List<int> list = [10, 20, 30];
  int val = 30;
  bool fnc(int ele) => ele > val; //関数定義
  int ret = list.firstWhere(fnc);
  print(ret);

  // Unhandled exception:
  // Bad state: No element
}

//実験2
// orElseでエラーが発生しないように処理
void test2() {
  List<int> list = [10, 20, 30];
  int val = 30;
  bool fnc(int ele) => ele > val; //関数定義
  int ret = list.firstWhere(fnc, orElse: () => -1); //エラーが発生しないように
  print(ret);

  // -1を出力
}
