import 'package:dot_mobile_test/domain/entities/expense.dart';
import 'package:dot_mobile_test/domain/repositories/expense_repository.dart';

class GetExpenses {
  final ExpenseRepository repository;

  GetExpenses(this.repository);

  Future<List<Expense>> call() async {
    return await repository.getExpenses();
  }
}
