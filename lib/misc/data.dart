import 'package:dai_codex/models/category_data.dart';

class Data {
  // ------------------------------------- NOTE: View Options
  static bool isGrid = true;
  static bool showTitle = false;

  // ------------------------------------- NOTE: Time
  static const milliSecond = 300;

  static final List<Category> categories = <Category>[
    Category(name: "Characters", path: "assets/json/characters.json"),
    Category(name: "Creatures", path: "assets/json/creatures.json"),
    Category(name: "History", path: "assets/json/history.json"),
    Category(name: "Magic", path: "assets/json/magic.json"),
    Category(name: "Places", path: "assets/json/places.json"),
    Category(name: "Groups", path: "assets/json/groups.json"),
    Category(name: "Letters & Notes", path: "assets/json/letters_and_notes.json"),
    Category(name: "Maps", path: "assets/json/maps.json"),
    Category(name: "Tales", path: "assets/json/tales.json")
  ];

  static final List<String> winterPalaceMap = <String>[
    "assets/maps/winter_palace_1.jpg",
    "assets/maps/winter_palace_2.jpg",
    "assets/maps/winter_palace_3.jpg",
    "assets/maps/winter_palace_4.jpg",
  ];
}