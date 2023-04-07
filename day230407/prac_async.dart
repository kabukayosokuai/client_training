//mainにFutureを明記しているが必須ではないらしい
//しかし、可読性を上げるために書くことがあった

prac_async() {
  Test1.start();
}

//コード内容
// リーフのバッテリー情報を取得し、それを表示するプログラム
// 実験内容
// async,awaitの有無によって挙動がどのように変わるのかを確認する

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
    Future.delayed(
      const Duration(seconds: 2),
      () => 20,
    );
  }
}
