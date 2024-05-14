import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('ensure text environment', (t) async {
    await t.pumpWidget(const App());
    expect(find.text(message), findsOneWidget);
  });
}

const message = 'it works';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      const Text(message).ensureTextEnvironment(context);
}
