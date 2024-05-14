import 'package:flutter/widgets.dart';

extension WrapColorStyle on Widget {
  /// Wrap with a [ColoredBox] with specified [color].
  Widget wrapBackground(Color color) => ColoredBox(color: color, child: this);

  /// Wrap text and icon color.
  ///
  /// Make sure the font color and icon color of the wrapped widgets
  /// are the same as the [color],
  /// as [Text] will find the color from [DefaultTextStyle] in context,
  /// and [Icon] will find the color from [IconTheme] in context.
  ///
  /// The [DefaultTextStyle.of] and [IconTheme.of]
  /// will definitely not return null, that they can be called safely,
  /// no ensure wrapper is needed.
  Widget wrapForeground(BuildContext context, Color color) =>
      wrapFontColor(context, color).wrapIconColor(context, color);

  /// Same as copy and modify the color of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  Widget wrapFontColor(BuildContext context, Color color) => DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: color),
        child: this,
      );

  /// Same as copy and modify the [IconThemeData.color]
  /// and wrap this widget with such data.
  Widget wrapIconColor(BuildContext context, Color color) => IconTheme(
        data: IconTheme.of(context).copyWith(color: color),
        child: this,
      );
}
