import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Helper {
  Future<List<String>> loadMd(BuildContext _context, String fileName) async {
    var allString = await DefaultAssetBundle.of(_context).loadString(fileName);

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(allString);

    return lines;
  }
}