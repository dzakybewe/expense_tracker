import 'package:dot_mobile_test/presentation/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper_function/helper.dart';
import '../widgets/category_expense_card.dart';
import '../widgets/expense_card.dart';
import '../widgets/report_card.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(GetExpensesEvent());
    context.read<ExpenseBloc>().add(GetTotalExpenseByCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0A97B0),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataLoaded) {
            final totalExpenses = state.totalExpenses;
            final todayTotal = state.todayTotal;
            final monthTotal = state.monthTotal;
            final todayExpenses = state.todayExpenses;
            final yesterdayExpenses = state.yesterdayExpenses;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Halo, User!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "Jangan lupa catat keuanganmu setiap hari!",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      /* DAILY & MONTHLY REPORT CARDS */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ReportCard(
                              title: "Pengeluaranmu \nhari ini",
                              amount: formatCurrency(todayTotal),
                              bgColor: const Color(0xFF0A97B0),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: ReportCard(
                              title: "Pengeluaranmu \nbulan ini",
                              amount: formatCurrency(monthTotal),
                              bgColor: const Color(0xFF46B5A7),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Pengeluaran berdasarkan kategori",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      /* CATEGORY BASED EXPENSE */
                      SizedBox(
                        height: 130,
                        child: totalExpenses.isEmpty
                            ? const Text("Belum ada pengeluaran")
                            : ListView.separated(
                                itemCount: totalExpenses.keys.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  final category =
                                      totalExpenses.keys.elementAt(index);
                                  final amount = totalExpenses[category];

                                  return CategoryExpenseCard(
                                    title: category.name,
                                    amount: formatCurrency(amount!),
                                    category: category,
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        "Hari ini",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /* Today Expenses */
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 190),
                        child: todayExpenses.isEmpty
                            ? const Text("Belum ada pengeluaran")
                            : ListView.separated(
                                itemCount: todayExpenses.length,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  final expense = todayExpenses[index];
                                  return ExpenseCard(
                                    title: expense.title,
                                    amount: formatCurrency(expense.amount),
                                    category: expense.category,
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        "Kemarin",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /* Yesterday expenses */
                      SizedBox(
                        height: 190,
                        child: yesterdayExpenses.isEmpty
                            ? const Text("Belum ada pengeluaran")
                            : ListView.separated(
                                itemCount: yesterdayExpenses.length,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  final expense = yesterdayExpenses[index];
                                  return ExpenseCard(
                                    title: expense.title,
                                    amount: formatCurrency(expense.amount),
                                    category: expense.category,
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ExpenseError) {
            return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.black)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
