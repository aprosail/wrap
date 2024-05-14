import 'package:flutter/widgets.dart';

extension WrapAlign on Widget {
  /// Same as wrap such widget inside a [Center] widget.
  Widget get wrapCenter => Center(child: this);
}
