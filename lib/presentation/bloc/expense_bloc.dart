import 'package:bloc/bloc.dart';
import 'package:dot_mobile_test/domain/entities/expense.dart';
import 'package:dot_mobile_test/domain/usecases/get_category_expense.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/category.dart';
import '../../domain/usecases/add_expense.dart';
import '../../domain/usecases/get_expenses.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final AddExpense addExpense;
  final GetExpenses getExpenses;
  final GetCategoryExpense getCategoryExpense;

  ExpenseBloc(
      {required this.addExpense,
      required this.getExpenses,
      required this.getCategoryExpense})
      : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit) async {
      try {
        await addExpense(event.expense);
        emit(ExpenseAdded());
        add(GetExpensesEvent());
      } catch (e) {
        emit(const ExpenseError("Failed to add expense"));
      }
    });

    on<GetExpensesEvent>((event, emit) async {
      await _fetchData(emit);
    });

    on<GetTotalExpenseByCategoryEvent>((event, emit) async {
      await _fetchData(emit);
    });
  }

  Future<void> _fetchData(Emitter<ExpenseState> emit) async {
    emit(ExpenseLoading());
    try {
      final expenses = await getExpenses();
      final totalExpenses = await getCategoryExpense();

      final DateTime now = DateTime.now();
      final DateTime today = DateTime(now.year, now.month, now.day);
      final DateTime yesterday = today.subtract(const Duration(days: 1));
      final DateTime startOfMonth = DateTime(now.year, now.month, 1);

      double todayTotal = 0;
      double monthTotal = 0;

      List<Expense> todayExpenses = [];
      List<Expense> yesterdayExpenses = [];

      for (var expense in expenses) {
        if (expense.date.isAfter(today) ||
            expense.date.isAtSameMomentAs(today)) {
          todayTotal += expense.amount;
          todayExpenses.add(expense);
        }
        if (expense.date.isAfter(startOfMonth) ||
            expense.date.isAtSameMomentAs(startOfMonth)) {
          monthTotal += expense.amount;
        }
        if (expense.date.isBefore(today) &&
            expense.date
                .isAfter(yesterday.subtract(const Duration(milliseconds: 1)))) {
          yesterdayExpenses.add(expense);
        }
      }

      emit(DataLoaded(expenses, totalExpenses, todayTotal, monthTotal,
          todayExpenses, yesterdayExpenses));
    } catch (e) {
      emit(const ExpenseError("Failed to fetch data"));
    }
  }
}
