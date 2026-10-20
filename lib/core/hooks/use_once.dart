import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Runs [callback] once for the lifetime of the current HookWidget state.
void useOnce(VoidCallback callback) {
  useEffect(() {
    callback();
    return null;
  }, const []);
}
