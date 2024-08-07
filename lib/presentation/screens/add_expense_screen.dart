import 'package:dot_mobile_test/domain/entities/expense.dart';
import 'package:dot_mobile_test/presentation/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../data/models/category.dart';
import '../widgets/custom_textfield.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Pengeluaran Baru",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextfield(
                controller: _titleController,
                title: "Nama pengeluaran",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: _categoryController,
                title: "Category",
                suffixIcon: Icons.arrow_forward_ios,
                readOnly: true,
                onSuffixTap: () => _showCategoryPopUp(context),
                onTap: () => _showCategoryPopUp(context),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: _dateController,
                title: "Tanggal pengeluaran",
                suffixIcon: Icons.calendar_month,
                readOnly: true,
                onSuffixTap: () => _selectDate(context),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: _amountController,
                title: "Nominal",
                prefix: const Text("Rp. "),
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A97B0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    disabledBackgroundColor: const Color(0xFFE0E0E0),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50.0)),
                onPressed: (_titleController.text.isNotEmpty &&
                        _amountController.text.isNotEmpty &&
                        _selectedDate != null &&
                        _selectedCategory != null)
                    ? () {
                        final expense = Expense(
                            title: _titleController.text,
                            amount: double.parse(_amountController.text),
                            category: _selectedCategory!,
                            date: _selectedDate!);
                        context
                            .read<ExpenseBloc>()
                            .add(AddExpenseEvent(expense));
                        const snackBar = SnackBar(
                          content: Text('Berhasil menambahkan pengeluaran'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Category? _selectedCategory;

  void _showCategoryPopUp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.60,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pilih Kategori",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 18.0),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: category.bgColor,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedCategory = category.category;
                                  _categoryController.text =
                                      category.category.name;
                                });
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(category.iconAsset),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            category.category.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      String formattedDate =
          DateFormat("EEEE, d MMMM yyyy", "id_ID").format(pickedDate);
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = formattedDate;
      });
    }
  }
}
