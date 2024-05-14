import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrap/wrap.dart';

void main() {
  testWidgets('wrap colors', (t) async {
    await t.pumpWidget(Builder(
        builder: (context) => const ColorProbe()
            .wrapForeground(context, foreground)
            .wrapBackground(background)
            .ensureTextEnvironment(context)));
    expect(find.text('font color: $foreground'), findsOneWidget);
    expect(find.text('icon color: $foreground'), findsOneWidget);
  });
}

const background = Color(0xff804044);
const foreground = Color(0xffdedcda);

class ColorProbe extends StatelessWidget {
  const ColorProbe({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Text('font color: ${DefaultTextStyle.of(context).style.color}'),
      Text('icon color: ${IconTheme.of(context).color}'),
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}
