import 'package:flutter/widgets.dart';

import 'inherit.dart';

class InheritHandler<T> extends StatefulWidget {
  const InheritHandler({
    super.key,
    required this.data,
    required this.child,
  });

  final T data;
  final Widget child;

  @override
  State<InheritHandler<T>> createState() => _InheritHandlerState<T>();
}

class _InheritHandlerState<T> extends State<InheritHandler<T>> {
  late var _data = widget.data;
  T get data => _data;
  set data(T value) {
    if (_data != value) setState(() => _data = value);
  }

  @override
  void didUpdateWidget(covariant InheritHandler<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) => widget.child
      .wrapInherit(_data)
      .wrapInheritUnchanged(InheritHandlerCaller<T>(
        updater: (data) => this.data = data,
      ));
}

class InheritHandlerCaller<T> {
  const InheritHandlerCaller({required this.updater});

  final void Function(T data) updater;
}

extension WrapHandler on Widget {
  Widget wrapHandler<T>(T data) => InheritHandler<T>(data: data, child: this);
}

extension UpdateHandlerData on BuildContext {
  void maybeUpdate<T>(T data) => find<InheritHandlerCaller<T>>()?.updater(data);

  void updateAndTrust<T>(T data) =>
      findAndTrust<InheritHandlerCaller<T>>().updater(data);

  void updateAndCheck<T>(T data) =>
      findAndCheck<InheritHandlerCaller<T>>().updater(data);
}
