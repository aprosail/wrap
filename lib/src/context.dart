import 'package:flutter/widgets.dart';

extension WrapContext on Widget {
  /// Same as wrapping current widget with a [Builder], which keeps chain style.
  Widget wrap(Widget Function(BuildContext context, Widget child) builder) =>
      Builder(builder: (context) => builder(context, this));
}

/// An encapsulation of [Builder], which makes it conciser.
Widget builder(Widget Function(BuildContext context) builder) =>
    Builder(builder: builder);

extension WrapMedia on Widget {
  Widget wrapMedia(MediaQueryData data) => MediaQuery(data: data, child: this);

  /// Ensure the widget is wrapped by a [MediaQuery] ancestor.
  ///
  /// Provide environment for [MediaQuery.of] that many widgets need,
  /// including the [Text] widget. Without such ancestor,
  /// once displaying a [Text],
  /// it will throw exceptions.
  Widget ensureMedia(BuildContext context) {
    final media = MediaQuery.maybeOf(context);
    return media == null
        ? wrapMedia(MediaQueryData.fromView(View.of(context)))
        : this;
  }
}
