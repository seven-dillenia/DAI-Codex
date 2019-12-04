import 'package:meta/meta.dart';
import 'dart:convert';

class CodexData {
  final String title;
  final String tarotPath;
  final String codexPath;

  CodexData({
    @required this.title,
    @required this.tarotPath,
    @required this.codexPath,
  });

  factory CodexData.fromJson(Map<String, dynamic> json) => CodexData(
        title: json["title"],
        tarotPath: json["tarot_path"],
        codexPath: json["codex_path"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": tarotPath,
        "path": codexPath,
      };

  static List<CodexData> decodeJsonToTarotDataList(String str) =>
      List<CodexData>.from(json.decode(str).map((x) => CodexData.fromJson(x)));

  String tarotDataToJson(List<CodexData> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
