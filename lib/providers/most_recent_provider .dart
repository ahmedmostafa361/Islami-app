import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utlis/shared_preferences_helper .dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  Future<void> readLastSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKey.mostRecentList) ?? [];
    List<int> mostRecentListAsInt = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();

    mostRecentList = mostRecentListAsInt.reversed.toList();
    notifyListeners();
  }
}
