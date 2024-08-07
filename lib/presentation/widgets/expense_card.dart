import 'package:dot_mobile_test/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.category});

  final String title;
  final String amount;
  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryModel = categoryMap[category]!;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 90),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: Colors.white,
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(34.0),
                      color: categoryModel.bgColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        categoryModel.iconAsset,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
