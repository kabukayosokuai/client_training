prac_async() {
  Test1.start();
}

//実験１
//情報の取得時だけFutureを付与
// 結果は以下
// 情報を取得します
// 情報を取得中です
// Test1 バッテリー残量はInstance of 'Future<int>'%です
class Test1 {
  static void start() {
    print("情報を取得します");
    display();
  }

  //取得した情報の表示
  static void display() {
    Future<int> status = fetch();
    print("Test1 バッテリー残量は$status%です");
  }

  //情報の取得
  static Future<int> fetch() {
    print("情報を取得中です");
    return Future.delayed(const Duration(seconds: 2), () => 10);
  }
}
