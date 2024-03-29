import 'package:dai_codex/misc/routes.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(DAICodex());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Styles.yellow,
    statusBarBrightness: Brightness.dark
  ));
}

class DAICodex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      home: CategoryScreen(),
    );
  }
}
