import 'package:flutter/widgets.dart';

extension WrapContext on Widget {
  /// Same as wrapping current widget with a [Builder], which keeps chain style.
  Widget wrap(Widget Function(BuildContext context, Widget child) builder) =>
      Builder(builder: (context) => builder(context, this));
}

/// An encapsulation of [Builder], which makes it conciser.
Widget builder(Widget Function(BuildContext context) builder) =>
    Builder(builder: builder);
