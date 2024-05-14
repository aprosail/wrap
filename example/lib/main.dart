import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('app root')).ensureTextEnvironment(context);
}
