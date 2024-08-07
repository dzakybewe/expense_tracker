import 'package:dot_mobile_test/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryExpenseCard extends StatelessWidget {
  const CategoryExpenseCard(
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
      constraints: const BoxConstraints(minHeight: 120, minWidth: 130),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: Colors.white,
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.0),
                  color: categoryModel.bgColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(categoryModel.iconAsset),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
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
