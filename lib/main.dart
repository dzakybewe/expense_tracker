import 'package:dot_mobile_test/data/datasources/expense_local_datasource.dart';
import 'package:dot_mobile_test/data/repositories/expense_repository_impl.dart';
import 'package:dot_mobile_test/domain/usecases/add_expense.dart';
import 'package:dot_mobile_test/domain/usecases/get_category_expense.dart';
import 'package:dot_mobile_test/domain/usecases/get_expenses.dart';
import 'package:dot_mobile_test/presentation/bloc/expense_bloc.dart';
import 'package:dot_mobile_test/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDataSource = ExpenseLocalDatasource();
  final expenseRepository = ExpenseRepositoryImpl(localDataSource);

  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(MyApp(expenseRepository: expenseRepository)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.expenseRepository});

  final ExpenseRepositoryImpl expenseRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseBloc(
        addExpense: AddExpense(expenseRepository),
        getExpenses: GetExpenses(expenseRepository),
        getCategoryExpense: GetCategoryExpense(expenseRepository),
      ),
      child: MaterialApp(
        title: 'DOT Indonesia Mobile Dev Test',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: GoogleFonts.sourceSans3TextTheme()),
        home: const HomeScreen(),
      ),
    );
  }
}
