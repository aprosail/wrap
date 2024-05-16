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

extension StringToTextWidget on String {
  /// Convert a [String] into a [Text] widget.
  Widget get textWidget => Text(this);
}

extension WrapTextStyle on Widget {
  /// If you want to modify based on current text style from context,
  /// please consider [modifyTextStyle],
  /// which will require a [BuildContext] while this method will not.
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

  /// Same as copy and modify the font size of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  ///
  /// This method will only modify one property.
  /// When you are going to modify more than one property,
  /// you should use [modifyTextStyle] or [wrapTextStyle] instead,
  /// which is more effective.
  ///
  /// Calling those methods more than once might waste performance.
  /// And calling them in the same context will cover the previous value.
  Widget wrapFontSize(BuildContext context, double size) {
    assert(size > 0);
    return DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.copyWith(fontSize: size),
      child: this,
    );
  }

  /// Same as copy and modify the font family of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  ///
  /// This method will only modify one property.
  /// When you are going to modify more than one property,
  /// you should use [modifyTextStyle] or [wrapTextStyle] instead,
  /// which is more effective.
  ///
  /// Calling those methods more than once might waste performance.
  /// And calling them in the same context will cover the previous value.
  Widget wrapFontFamily(BuildContext context, String family) =>
      DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(fontFamily: family),
        child: this,
      );

  /// Same as copy and modify the font family fallback
  /// of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  ///
  /// This method will only modify one property.
  /// When you are going to modify more than one property,
  /// you should use [modifyTextStyle] or [wrapTextStyle] instead,
  /// which is more effective.
  ///
  /// Calling those methods more than once might waste performance.
  /// And calling them in the same context will cover the previous value.
  Widget wrapFontFamilyFallback(
    BuildContext context,
    List<String> fontFamilyFallback,
  ) =>
      DefaultTextStyle(
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontFamilyFallback: fontFamilyFallback),
        child: this,
      );

  /// Same as copy and modify the color of [DefaultTextStyle.style]
  /// and wrap this widget with such data.
  ///
  /// This method will only modify one property.
  /// When you are going to modify more than one property,
  /// you should use [modifyTextStyle] or [wrapTextStyle] instead,
  /// which is more effective.
  ///
  /// Calling those methods more than once might waste performance.
  /// And calling them in the same context will cover the previous value.
  Widget wrapFontColor(BuildContext context, Color color) => DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: color),
        child: this,
      );
}
