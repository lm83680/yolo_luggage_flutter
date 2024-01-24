import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/home/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.focusedChild?.unfocus();
              },
              child: GetMaterialApp(
                theme: theme,
                darkTheme: darkTheme,
                home: const HomePage(),
              ),
            ));
  }
}
