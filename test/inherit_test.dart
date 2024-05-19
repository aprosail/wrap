import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('inherit and find', (t) async {
    const message = 'it works';
    await t.pumpWidget(
      ReContext(
        (context) => Text(context.findAndTrust<String>())
            .wrapCenter
            .ensureTextEnvironment(context),
      ).wrapInherit(message),
    );
    expect(find.text(message), findsOneWidget);
  });
}
