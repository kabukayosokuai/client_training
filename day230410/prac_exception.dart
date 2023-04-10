import 'dart:async';

prac_exception() {
  test5();
}

//実験１
// 通常通りの例外処理
test1() {
  print("test1処理を開始します");
  try {
    error_code();
  } on Exception {
    print("Exceptionを検知しました");
  }
}

//実験２
// 実験１に対してFormatExceptionを発生させた時
// 処理を開始します
// Exceptionを検知しました
// ⇨Exceptionは全ての例外をキャッチする
test2() {
  print("test2処理を開始します");
  try {
    format_error_code();
  } on Exception {
    print("Exceptionを検知しました");
  }
}

//実験3
// formatエラーに対し、DeferredLoadExceptionしか例外処理をしなかった場合
// めでたく、スタックトレースが表示されてしまいました
test3() {
  print("test3処理を開始します");
  try {
    format_error_code();
  } on DeferredLoadException {
    print("Exceptionを検知しました");
  }
}

//実験４
// onの代わりにcatchを設定した場合
test4() {
  print("test4処理を開始します");
  try {
    format_error_code();
  } catch (e, s) {
    print("Exceptionを検知しました");
    print(e); //発生した例外の型(FormatExceptionなど)をeに格納
    print(s); //エラーが発生したスタックトレースをsに格納
  }
}

//実験５
// finallyを用いた場合
// tryでもcatchでもどちらの処理でもfinallyを実施していることを確認
test5() {
  print("test5処理を開始します");
  try {
    print("無事処理を実行");
    // format_error_code();
  } catch (e, s) {
    print("Exceptionを検知しました");
    print(e); //発生した例外の型(FormatExceptionなど)をeに格納
    print(s); //エラーが発生したスタックトレースをsに格納
  } finally {
    print("finally 実行");
  }
}

error_code() {
  throw Exception("何かしらの問題");
}

format_error_code() {
  throw FormatException("フォーマットエラー");
}
