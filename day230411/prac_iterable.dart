///これはイテレータ練習用の関数です
prac_iterable() {
  pracSublist();
}

const list = [10, 20, 30, 40, 50];

//sublist
pracSublist() {
  print(list.sublist(2, 4));
}

//skip
//同じ書き方になるのか調べる
pracSkip() {
  print(list.skip(2));
  print(list);
}

//map
pracMap() {
  final res = list.map((ele) => ele + 1).map((ele) => "$ele人").toList();
  print(res);
  // print(res+1);←python風には描けない
}

//firstWhere
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

//any,every
pracAny1() {
  bool result1 = list.any((element) => element == 20); //=>これならcontainsを用いた方が良い
  print(result1);
}

//elementAt
//同じ出力になるかかくにん
// ⇨同じ出力に
eleAt1() {
  print(list.elementAt(2));
  print(list[2]);
}
