import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/screen/home/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          fontFamily: 'DeYiHei',
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          fontFamily: 'DeYiHei',
          scaffoldBackgroundColor: const Color(0xff181818),
          brightness: Brightness.dark,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) =>GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme,
                darkTheme: darkTheme,
                home: const HomePage(),
              )  
            );
  }
}
