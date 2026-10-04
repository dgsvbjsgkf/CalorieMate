class FoodEntry {
  final String id;
  final String name;
  final int calories;
  final DateTime date;

  FoodEntry({
    required this.id,
    required this.name,
    required this.calories,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'calories': calories,
      'date': date.toIso8601String(),
    };
  }

  factory FoodEntry.fromMap(Map<String, dynamic> map) {
    return FoodEntry(
      id: map['id'] ?? '',
      name: map['name'] ?? 'Unknown food',
      calories: (map['calories'] ?? 0) as int,
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
    );
  }

  FoodEntry copyWith({
    String? id,
    String? name,
    int? calories,
    DateTime? date,
  }) {
    return FoodEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      date: date ?? this.date,
    );
  }
}
