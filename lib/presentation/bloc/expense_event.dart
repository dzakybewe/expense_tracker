part of 'expense_bloc.dart';

sealed class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;

  const AddExpenseEvent(this.expense);

  @override
  List<Object> get props => [expense];
}

class GetExpensesEvent extends ExpenseEvent {}

class GetTotalExpenseByCategoryEvent extends ExpenseEvent {}
