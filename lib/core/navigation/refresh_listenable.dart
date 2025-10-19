import 'dart:async';
import 'package:flutter/widgets.dart';

class RefreshStream extends ChangeNotifier {
  RefreshStream(Stream<dynamic> stream) {
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
