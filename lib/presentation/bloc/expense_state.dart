part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();
}

final class ExpenseLoading extends ExpenseState {
  @override
  List<Object?> get props => [];
}

final class ExpenseInitial extends ExpenseState {
  @override
  List<Object> get props => [];
}

final class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;

  const ExpenseLoaded(this.expenses);

  @override
  List<Object> get props => [expenses];
}

final class ExpenseAdded extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}

class TotalCategoryExpenseLoaded extends ExpenseState {
  final Map<Category, double> totalExpenses;

  const TotalCategoryExpenseLoaded(this.totalExpenses);

  @override
  List<Object> get props => [totalExpenses];
}

class DataLoaded extends ExpenseState with EquatableMixin {
  final List<Expense> expenses;
  final Map<Category, double> totalExpenses;
  final double todayTotal;
  final double monthTotal;
  final List<Expense> todayExpenses;
  final List<Expense> yesterdayExpenses;

  const DataLoaded(this.expenses, this.totalExpenses, this.todayTotal,
      this.monthTotal, this.todayExpenses, this.yesterdayExpenses);

  @override
  List<Object> get props => [expenses, totalExpenses];

  @override
  String toString() => 'DataLoaded';
}
