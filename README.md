# Wrap

Chain style programming syntax sugar utilities for Flutter widgets.

Too many `child` or `children` parameters with their nestings and indents
makes Flutter code hard to read, so here comes this package.
This package provides a chain style programming syntax
to make your code clean and tidy,
especially with so many single child widgets.

## How to use

Following codes are equivalent widgets but
before and after using such package.

Before:

```dart
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(View.of(context)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ColoredBox(
          color: const Color(0xff804044),
          child: DefaultTextStyle(
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: const Color(0xffdedcda),
                ),
            child: IconTheme(
              data: IconTheme.of(context).copyWith(
                color: const Color(0xffdedcda),
              ),
              child: const Center(
                child: Text('app root'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```

After:

```dart
import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const Text('app root')
      .wrapCenter
      .wrapForeground(context, const Color(0xffdedcda))
      .wrapBackground(const Color(0xff804044))
      .ensureTextEnvironment(context);
}
```
