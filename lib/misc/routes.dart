import 'package:dai_codex/screens/category_screen.dart';
import 'package:dai_codex/screens/tarot_screen.dart';
import 'package:dai_codex/screens/codex_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case CategoryScreen.id:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case TarotScreen.id:
        return MaterialPageRoute(builder: (_) => TarotScreen());
      case CodexScreen.id:
        return MaterialPageRoute(builder: (_) => CodexScreen(codexData: settings.arguments,));
      default:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
    }
  }
}