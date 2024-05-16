import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('re context root', (t) async {
    await t.pumpWidget(
      ReContext((context) => const ColorProbe()
          .wrapForeground(context, foreground)
          .ensureTextEnvironment(context)),
    );
    expect(find.text('font color: $foreground'), findsOneWidget);
    expect(find.text('icon color: $foreground'), findsOneWidget);
  });

  testWidgets('re context wrap', (t) async {
    await t.pumpWidget(
      const ColorProbe().wrap((context, child) => child
          .wrapForeground(context, foreground)
          .ensureTextEnvironment(context)),
    );
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
