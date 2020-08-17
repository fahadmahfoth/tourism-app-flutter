import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/src/utls/theme.dart';
import 'pages/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            theme: notifier.darkTheme ? light : dark,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child,
              );
            },
            home: HomePage(),
          );
        },
      ),
    );
  }
}
