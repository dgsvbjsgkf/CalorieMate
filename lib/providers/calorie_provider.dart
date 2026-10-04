import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/food_entry.dart';

class StorageService {
  static const String _storageKey = 'calorie_entries';

  Future<List<FoodEntry>> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(_storageKey);

    if (savedData == null || savedData.isEmpty) {
      return [];
    }

    try {
      final decoded = jsonDecode(savedData);
      if (decoded is! List) {
        return [];
      }

      return decoded
          .map((item) => FoodEntry.fromMap(Map<String, dynamic>.from(item)))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> saveEntries(List<FoodEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      entries.map((entry) => entry.toMap()).toList(),
    );
    await prefs.setString(_storageKey, encoded);
  }
}
