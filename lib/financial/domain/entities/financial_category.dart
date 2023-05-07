import 'package:flutter/material.dart';

class FinancialCategory {
  late String structure;
  late String name;
  late Image? image;

  FinancialCategory({
    required this.structure,
    required this.name,
    this.image,
  });
}
