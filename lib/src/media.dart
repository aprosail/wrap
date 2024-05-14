import 'package:flutter/widgets.dart';

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
