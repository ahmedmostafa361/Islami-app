import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey {
  static const String mostRecentList = 'most_recent';
}

saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList =
      prefs.getStringList(SharedPrefsKey.mostRecentList) ?? [];
  if (mostRecentList.contains("$newSuraIndex")) {
    mostRecentList.remove('$newSuraIndex');
  } else {
    mostRecentList.add('$newSuraIndex');
  }
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  prefs.setStringList(SharedPrefsKey.mostRecentList, mostRecentList);
}

Future<List<int>> readLastSuraList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentListAsString =
      prefs.getStringList(SharedPrefsKey.mostRecentList) ?? [];
  List<int> mostRecentListAsInt = mostRecentListAsString
      .map((element) => int.parse(element))
      .toList();
  return mostRecentListAsInt.reversed.toList();
}
