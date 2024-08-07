import 'package:equatable/equatable.dart';
import '../../data/models/category.dart';

class Expense extends Equatable {
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  const Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  @override
  List<Object?> get props => [title, amount, category, date];
}
