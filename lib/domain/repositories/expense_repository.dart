import 'package:dot_mobile_test/domain/entities/expense.dart';
import '../../data/models/category.dart';

abstract class ExpenseRepository {
  Future<void> addExpense(Expense expense);

  Future<List<Expense>> getExpenses();

  Future<Map<Category, double>> getTotalExpensesByCategory();
}
