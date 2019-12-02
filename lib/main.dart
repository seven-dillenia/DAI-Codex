import 'package:dai_codex/misc/routes.dart';
import 'package:dai_codex/screens/category_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(DAICodex());


class DAICodex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      home: CategoryScreen(),
    );
  }
}
