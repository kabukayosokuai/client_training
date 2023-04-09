prac_async() {
  Test3.start();
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

//実験２
//情報の取得時だけFutureを付与
// 結果は以下
// 情報を取得します
// 情報を取得中です
// Test2 バッテリー残量は20%です
// ⇨同期処理なので取得中ですから少しの待ち時間あり
class Test2 {
  static void start() {
    print("情報を取得します");
    display();
  }

  //取得した情報の表示
  static void display() {
    int status = fetch();
    print("Test2 バッテリー残量は$status%です");
  }

  //情報の取得
  static fetch() {
    int i = 0;
    print("情報を取得中です");
    while (i < 999999999) {
      i++;
    }
    return 20;
  }
}

//実験３（実践的な構成？）
//情報の取得時だけFutureを付与
// 結果は以下
// 情報を取得します
// 情報取得中です
// Test3 バッテリー残量は30%です
// 情報取得中ですから２秒後にバッテリー情報取得
// displayより後ろにあるloadingを処理していることからローディング処理が止まらずにデータの読み込みができる
class Test3 {
  static void start() {
    print("情報を取得します");
    display();
    loading();
  }

  //バッテリー情報の表示
  static void display() async {
    int status = await fetch();
    print("Test3 バッテリー残量は$status%です");
  }

  //待機中のUI（ローディング画面）
  static void loading() => print("情報取得中です");

  //情報の取得
  static Future<int> fetch() {
    return Future.delayed(Duration(seconds: 2), () => 30);
  }
}
