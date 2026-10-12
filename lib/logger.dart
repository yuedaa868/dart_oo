/// 日志能力 mixin：通过 with 混入任意类。
mixin Logger {
  void log(String message) => print('[LOG] $message');
}
