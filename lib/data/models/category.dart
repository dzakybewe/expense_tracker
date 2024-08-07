import 'package:flutter/material.dart';

enum Category {
  Makanan,
  Internet,
  Edukasi,
  Hadiah,
  Transport,
  Belanja,
  AlatRumah,
  Olahraga,
  Hiburan
}

class CategoryModel {
  final Category category;
  final String iconAsset;
  final Color bgColor;

  CategoryModel(
      {required this.category, required this.iconAsset, required this.bgColor});
}

final List<CategoryModel> categories = [
  CategoryModel(
      category: Category.Makanan,
      iconAsset: "assets/food_icon.svg",
      bgColor: const Color(0xFFF2C94C)),
  CategoryModel(
      category: Category.Internet,
      iconAsset: "assets/internet_icon.svg",
      bgColor: const Color(0xFF56CCF2)),
  CategoryModel(
      category: Category.Edukasi,
      iconAsset: "assets/edukasi_icon.svg",
      bgColor: const Color(0xFFF2994A)),
  CategoryModel(
      category: Category.Hadiah,
      iconAsset: "assets/hadiah_icon.svg",
      bgColor: const Color(0xFFEB5757)),
  CategoryModel(
      category: Category.Transport,
      iconAsset: "assets/transport_icon.svg",
      bgColor: const Color(0xFF9B51E0)),
  CategoryModel(
      category: Category.Belanja,
      iconAsset: "assets/belanja_icon.svg",
      bgColor: const Color(0xFF27AE60)),
  CategoryModel(
      category: Category.AlatRumah,
      iconAsset: "assets/alat_rumah_icon.svg",
      bgColor: const Color(0xFFBB6BD9)),
  CategoryModel(
      category: Category.Olahraga,
      iconAsset: "assets/olahraga_icon.svg",
      bgColor: const Color(0xFF2D9CDB)),
  CategoryModel(
      category: Category.Hiburan,
      iconAsset: "assets/hiburan_icon.svg",
      bgColor: const Color(0xFF2F80ED)),
];

final Map<Category, CategoryModel> categoryMap = {
  for (var categoryModel in categories) categoryModel.category: categoryModel,
};
