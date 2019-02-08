// Dart基础语法

void main() {
  var content = "hello, i'am pinger.";

  dynamic content1;
  content1 = 123;
  content1 = "qwe";

  final content2 = "qwer";
  const content3 = "zxc";

  print(say("China", "Apple"));
}

bool isSuccess(int a, int b) => (a + b > 3);

execute(var callback) {
  callback();
}

String say(String from, String msg, [int age]) {
  return "i'm from $from and i hava $msg,i'm $age old.";
}
