import 'package:flutter/widgets.dart';

extension WrapColorStyle on Widget {
  Widget wrapBackground(Color color) => ColoredBox(color: color, child: this);
}
