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
}
