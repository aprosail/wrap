import 'package:flutter/widgets.dart';

extension WrapContext on Widget {
  Widget wrap(Widget Function(BuildContext context, Widget child) builder) =>
      ReContext((context) => builder(context, this));
}

/// Refresh context, same as [Builder] but with conciser API.
class ReContext extends StatelessWidget {
  const ReContext(this.builder, {super.key});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) => builder(context);
}
