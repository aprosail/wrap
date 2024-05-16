import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late var _height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) => 'app root'
      .text(align: TextAlign.center)
      .modifyTextStyle(
        context,
        (raw) => raw.copyWith(
          color: const Color(0xfffefdfa),
          fontSize: _height / 6.18,
          fontWeight: FontWeight.w900,
        ),
      )
      .wrapPadding(const EdgeInsets.all(75))
      .wrapCenter
      .wrapBackground(const Color(0xff804044))
      .listenSizeChange(this, (size) => _height = size.height)
      .ensureTextEnvironment(context);
}
