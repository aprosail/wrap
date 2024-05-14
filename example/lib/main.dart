import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const Text('app root')
      .wrapCenter
      .wrapForeground(context, const Color(0xffdedcda))
      .wrapBackground(const Color(0xff804044))
      .ensureTextEnvironment(context);
}
