import 'package:flutter/material.dart';

import '../models/food_entry.dart';
import '../services/storage_service.dart';

class CalorieProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();

  List<FoodEntry> _entries = [];
  bool _isLoading = true;

  List<FoodEntry> get entries => List.unmodifiable(_entries);
  bool get isLoading => _isLoading;

  Future<void> loadEntries() async {
    _isLoading = true;
    notifyListeners();

    _entries = await _storageService.loadEntries();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addEntry(String name, int calories) async {
    final cleanedName = name.trim();

    if (cleanedName.isEmpty) {
      throw ArgumentError('Food name cannot be empty.');
    }

    if (calories <= 0) {
      throw ArgumentError('Calories must be greater than zero.');
    }

    final newEntry = FoodEntry(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: cleanedName,
      calories: calories,
      date: DateTime.now(),
    );

    _entries.add(newEntry);
    await _storageService.saveEntries(_entries);
    notifyListeners();
  }

  Future<void> deleteEntry(String id) async {
    _entries.removeWhere((entry) => entry.id == id);
    await _storageService.saveEntries(_entries);
    notifyListeners();
  }

  List<FoodEntry> get todayEntries {
    final today = DateTime.now();
    return _entries.where((entry) {
      return entry.date.year == today.year &&
          entry.date.month == today.month &&
          entry.date.day == today.day;
    }).toList();
  }

  int get todayCalories {
    return todayEntries.fold<int>(0, (sum, entry) => sum + entry.calories);
  }

  int get totalEntries => _entries.length;
}
