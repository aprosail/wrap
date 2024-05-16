import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('ensure text environment', (t) async {
    const message = 'it works';
    await t.pumpWidget(ReContext(
      (context) => const Text(message).ensureTextEnvironment(context),
    ));
    expect(find.text(message), findsOneWidget);
  });

  testWidgets('modify text style', (t) async {
    const fontColor = Color(0xff804044);
    const fontSize = 23.4;
    const fontFamily = 'iosevka';
    await t.pumpWidget(
      ReContext((context) {
        final font = DefaultTextStyle.of(context).style;
        return <Widget>[
          'font color: ${font.color}'.textWidget,
          'font size: ${font.fontSize}'.textWidget,
          'font family: ${font.fontFamily}'.textWidget,
        ].centerColumn();
      }).wrap((context, child) => child
          .modifyTextStyle(
            context,
            (raw) => raw.copyWith(
              color: fontColor,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          )
          .ensureTextEnvironment(context)),
    );
    expect(find.text('font color: $fontColor'), findsOneWidget);
    expect(find.text('font size: $fontSize'), findsOneWidget);
    expect(find.text('font family: $fontFamily'), findsOneWidget);
  });
}
