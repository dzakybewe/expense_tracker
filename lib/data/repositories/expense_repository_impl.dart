import 'package:dot_mobile_test/data/datasources/expense_local_datasource.dart';
import 'package:dot_mobile_test/data/models/expense_model.dart';
import 'package:dot_mobile_test/domain/entities/expense.dart';
import 'package:dot_mobile_test/domain/repositories/expense_repository.dart';

import '../models/category.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDatasource localDatasource;

  ExpenseRepositoryImpl(this.localDatasource);

  @override
  Future<void> addExpense(Expense expense) async {
    final expenseModel = ExpenseModel(
      title: expense.title,
      amount: expense.amount,
      category: expense.category,
      date: expense.date,
    );
    await localDatasource.addExpense(expenseModel);
  }

  @override
  Future<List<Expense>> getExpenses() async {
    return await localDatasource.getExpenses();
  }

  @override
  Future<Map<Category, double>> getTotalExpensesByCategory() async {
    final results = await localDatasource.queryExpensesByCategory();

    final Map<Category, double> totalExpenses = {};
    for (var row in results) {
      final category = Category.values[row['category'] as int];
      final totalAmount = row['totalAmount'] as double;
      totalExpenses[category] = totalAmount;
    }
    return totalExpenses;
  }
}
