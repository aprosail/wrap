import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('wrap colors', (t) async {
    await t.pumpWidget(Builder(
        builder: (context) => const ColorProbe()
            .wrapForeground(context, foreground)
            .ensureTextEnvironment(context)));
    expect(find.text('font color: $foreground'), findsOneWidget);
    expect(find.text('icon color: $foreground'), findsOneWidget);
  });
}

const foreground = Color(0xff804044);

class ColorProbe extends StatelessWidget {
  const ColorProbe({super.key});

  @override
  Widget build(BuildContext context) => [
        Text('font color: ${DefaultTextStyle.of(context).style.color}'),
        Text('icon color: ${IconTheme.of(context).color}'),
      ].centerColumn();
}
