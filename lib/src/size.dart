import 'package:flutter/widgets.dart';

extension WrapSizeChange on Widget {
  /// Listen the size change of this widget and handle [listener] as hook.
  ///
  /// This wrapper should be placed close to root of the widget tree,
  /// the size is based on the context of this widget,
  /// so that the inner size change listener should be close to
  /// where the context is build, or there might be potential conflicts.
  Widget listenSizeChange(
    BuildContext context,
    void Function(Size size) listener,
  ) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is SizeChangedLayoutNotification) {
          listener(context.size ?? MediaQuery.of(context).size);
          return true;
        }
        return false;
      },
      child: SizeChangedLayoutNotifier(child: this),
    );
  }
}
