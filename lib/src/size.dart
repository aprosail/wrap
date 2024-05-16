import 'package:flutter/widgets.dart';

extension WrapSizeChange on Widget {
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
