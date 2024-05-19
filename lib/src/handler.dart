import 'package:flutter/widgets.dart';

import '../wrap.dart';

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
  @override
  Widget build(BuildContext context) => widget.child.wrapInherit(widget.data);
}

extension WrapHandler on Widget {
  Widget wrapHandler<T>(T data) => InheritHandler<T>(data: data, child: this);
}
