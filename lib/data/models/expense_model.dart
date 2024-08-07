import 'package:dot_mobile_test/data/models/category.dart';
import 'package:dot_mobile_test/domain/entities/expense.dart';

class ExpenseModel extends Expense {
  const ExpenseModel({
    required super.title,
    required super.amount,
    required super.category,
    required super.date,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      title: json['title'],
      amount: json['amount'],
      category: Category.values[json['category']],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
    };
  }
}
