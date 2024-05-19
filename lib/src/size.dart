import 'package:flutter/widgets.dart';

extension WrapSize on Widget {
  /// Listen the size change of this widget and handle [listener] as hook.
  ///
  /// 1. The context is gotten from the [state] using [State.context].
  /// 2. Don't call [State.setState] inside the [listener].
  ///    [State.setState] will be called automatically post frame.
  ///    Because calling it inside the [listener] will cause conflict
  ///    for it will call [State.setState] when building.
  ///
  /// 3. This wrapper should be placed close to root of the widget tree,
  ///    the size is based on the context of this widget,
  ///    so that the inner size change listener should be close to
  ///    where the context is build, or there might be potential conflicts.
  Widget listenSizeChange(State state, void Function(Size size) listener) =>
      NotificationListener(
        onNotification: (notification) {
          if (notification is! SizeChangedLayoutNotification) return false;
          state.resolveSizeChange(listener);
          return true;
        },
        child: SizeChangedLayoutNotifier(child: this),
      );

  Widget wrapPadding(EdgeInsets padding) =>
      Padding(padding: padding, child: this);
}

extension _ResolveSizeChange on State {
  void resolveSizeChange(void Function(Size size) listener) {
    listener(context.size ?? MediaQuery.of(context).size);
    WidgetsBinding.instance.addPostFrameCallback(
      // ignore: invalid_use_of_protected_member
      (timestamp) => setState(() {}),
    );
  }
}
