import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

extension WrapDirectionality on Widget {
  Widget wrapDirectionality(TextDirection direction) => Directionality(
        textDirection: direction,
        child: this,
      );

  /// Ensure the widget is wrapped by a [Directionality] ancestor.
  ///
  /// Provide the [Directionality] environment which is required by
  /// many widgets including the [Text]. Once there's no such environment,
  /// displaying the [Text] will cause exceptions.
  ///
  /// The default text direction is [TextDirection.ltr],
  /// as most languages including English and Chinese are left-to-right.
  Widget ensureDirectionality(
    BuildContext context, {
    TextDirection defaultDirection = TextDirection.ltr,
  }) {
    final direction = Directionality.maybeOf(context);
    return direction == null ? wrapDirectionality(defaultDirection) : this;
  }
}

extension WrapTextEnvironment on Widget {
  /// Ensure any [Text] widget can be displayed.
  ///
  /// This wrapper will provide all required environment for the [Text] widget,
  /// including [Directionality] and [MediaQuery].
  /// The default text direction is [TextDirection.ltr],
  /// and you can specify it by customize the parameter input.
  ///
  /// Don't use it frequently for it will decrease the performance.
  /// It's only recommended to use it for debug propose.
  Widget ensureTextEnvironment(
    BuildContext context, {
    TextDirection defaultDirection = TextDirection.ltr,
  }) =>
      ensureDirectionality(context, defaultDirection: defaultDirection)
          .ensureMedia(context);
}

extension WrapTextStyle on Widget {
  Widget wrapTextStyle(TextStyle style) =>
      DefaultTextStyle(style: style, child: this);

  Widget modifyTextStyle(
    BuildContext context,
    TextStyle Function(TextStyle raw) modifier,
  ) =>
      DefaultTextStyle(
        style: modifier(DefaultTextStyle.of(context).style),
        child: this,
      );

  Widget wrapFontSize(BuildContext context, double size) {
    assert(size > 0);
    return modifyTextStyle(context, (style) => style.copyWith(fontSize: size));
  }

  Widget wrapFontFamily(BuildContext context, String family) =>
      modifyTextStyle(context, (style) => style.copyWith(fontFamily: family));

  Widget wrapFontFamilyFallback(
    BuildContext context,
    List<String> fontFamilyFallback,
  ) =>
      modifyTextStyle(
        context,
        (style) => style.copyWith(fontFamilyFallback: fontFamilyFallback),
      );

  /// Same as copy and modify the color of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  Widget wrapFontColor(BuildContext context, Color color) => DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: color),
        child: this,
      );
}
