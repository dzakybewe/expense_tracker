import 'package:dot_mobile_test/domain/entities/expense.dart';
import 'package:dot_mobile_test/domain/repositories/expense_repository.dart';

class AddExpense {
  final ExpenseRepository repository;

  AddExpense(this.repository);

  Future<void> call(Expense expense) async {
    return await repository.addExpense(expense);
  }
}
