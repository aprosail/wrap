import 'package:flutter/widgets.dart';

extension WrapDecorate on Widget {
  Widget wrapDecorate(
    Decoration decoration, {
    DecorationPosition position = DecorationPosition.background,
  }) =>
      DecoratedBox(decoration: decoration, position: position);
}
