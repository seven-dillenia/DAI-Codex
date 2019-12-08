import 'package:dai_codex/misc/routes.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as prefix0;

// void main() => runApp(DAICodex());

void main() {
  runApp(DAICodex());
  prefix0.SystemChrome.setSystemUIOverlayStyle(prefix0.SystemUiOverlayStyle(
    statusBarColor: Styles.yellow,
    statusBarBrightness: Brightness.dark
  ));
}


class DAICodex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(

      onGenerateRoute: RouteGenerator.generateRoute,
      home: CategoryScreen(),
    );
  }
}
