//mainにFutureを明記しているが必須ではないらしい
//しかし、可読性を上げるために書くことがあった

prac_async() {
  Test3.start();
}

//コード内容
// リーフのバッテリー情報を取得し、それを表示するプログラム
// 実験内容
// async,awaitの有無によって挙動がどのように変わるのかを確認する
// ⇨２行めまではスムーズだが、３行目で数秒後にバッテリー情報が出てくる
//実験１
//async,awaitなし
// 結果は以下
// 情報を取得します
// 情報を取得中です
// Test1 バッテリー残量は10%です
class Test1 {
  static void start() {
    print("情報を取得します");
    display();
  }

  //取得した情報の表示
  static void display() {
    int status = fetch();
    print("Test1 バッテリー残量は$status%です");
  }

  //情報の取得
  static int fetch() {
    int i = 0;
    print("情報を取得中です");
    while (i < 999999999) {
      i++;
    }
    return 10;
  }
}

//実験2
//asyncあり,awaitなし
// →結果は以下
// 情報を取得します
// 情報を取得中です
// Test2 バッテリー残量はInstance of 'Future<int?>'%です
// →一気に３行出てきて、数秒後に終了
class Test2 {
  static void start() {
    print("情報を取得します");
    display();
  }

  //取得した情報の表示
  static void display() {
    Future<int?> status = fetch();
    print("Test2 バッテリー残量は$status%です");
  }

  //情報の取得
  static Future<int?> fetch() async {
    print("情報を取得中です");
    return Future.delayed(
      const Duration(seconds: 2),
      () => 20,
    );
  }
}

//実験3
//asyncあり,awaitあり(ただし、Test3にはセットせず)
// 情報を取得します
// 情報を取得中です
// Test3 バッテリー残量は30%です
// →実験１と同じ流れで表示
class Test3 {
  static void start() {
    print("情報を取得します");
    display();
  }

  //取得した情報の表示
  static Future<void> display() async {
    //udate(Future型追加、async追加、)
    int? status = await fetch();
    print("Test3 バッテリー残量は$status%です");
  }

  //情報の取得
  static Future<int?> fetch() {
    print("情報を取得中です");
    return Future.delayed(
      const Duration(seconds: 2),
      () => 30,
    );
  }
}


//結果だけ見ると実験１と実験３は同じ。
// ではawaitを用いずに同期処理を書けば良いのでは？と思うが
// その同期処理の場合はスレッドが止まってしまい、他の処理ができない（フリーズ状態）
// しかし、awaitを用いることで、他のスレッドを止めることなく重い処理を実施できる