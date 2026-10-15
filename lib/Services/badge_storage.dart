import 'package:shared_preferences/shared_preferences.dart';

class BadgeStorage {
  static const String _storageKey = 'almanaque_badges';

  static Future<void> saveBadge(String badgeTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final badges = prefs.getStringList(_storageKey) ?? [];

    if (!badges.contains(badgeTitle)) {
      badges.add(badgeTitle);
      await prefs.setStringList(_storageKey, badges);
    }
  }

  static Future<List<String>> getBadges() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_storageKey) ?? [];
  }

  static Future<bool> hasBadge(String badgeTitle) async {
    final badges = await getBadges();
    return badges.contains(badgeTitle);
  }
}