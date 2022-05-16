
/// 日期：2022-05-15
/// 描述：Logger工具类
/// 说明：此为使用print简单打印
class Logger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    print('** $text [$isError]');
  }
}
