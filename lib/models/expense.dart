import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum Category {
  food('Food & Drink', '🍔', 0xFF00BCD4),
  transport('Transport', '🚗', 0xFF9C27B0),
  shopping('Shopping', '🛍️', 0xFFE91E63),
  bills('Bills', '📄', 0xFF3F51B5),
  health('Health', '💊', 0xFF4CAF50),
  entertainment('Entertainment', '🎬', 0xFFFF9800);

  const Category(this.label, this.emoji, this.color);
  final String label;
  final String emoji;
  final int color;
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = id ?? _uuid.v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'category': category.name,
        'date': date.toIso8601String(),
      };

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json['id'],
        title: json['title'],
        amount: (json['amount'] as num).toDouble(),
        category: Category.values.firstWhere((c) => c.name == json['category']),
        date: DateTime.parse(json['date']),
      );
}
