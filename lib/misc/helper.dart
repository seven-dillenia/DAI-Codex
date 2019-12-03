import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Helper {
  static Future<String> loadAsset(BuildContext _context, fileName) async {
    return await DefaultAssetBundle.of(_context).loadString(fileName);
  }

  static Future<List<String>> loadMd(BuildContext _context, String fileName) async {
    var allString = await loadAsset(_context, fileName);

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(allString);

    return lines;
  }
}
