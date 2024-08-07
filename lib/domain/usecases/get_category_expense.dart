import 'package:dot_mobile_test/data/models/category.dart';
import 'package:dot_mobile_test/domain/repositories/expense_repository.dart';

class GetCategoryExpense {
  final ExpenseRepository expenseRepository;

  GetCategoryExpense(this.expenseRepository);

  Future<Map<Category, double>> call() async {
    return await expenseRepository.getTotalExpensesByCategory();
  }
}
