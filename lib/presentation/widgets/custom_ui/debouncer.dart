
import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  final VoidCallback? action;
  Timer? _timer;

  Debouncer({this.action, Timer? timer, required this.milliseconds}) {
    _timer = timer;
  }

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}