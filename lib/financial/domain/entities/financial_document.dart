import 'package:flutter/material.dart';
import 'package:mcontrol/financial/domain/entities/financial_category.dart';

enum DocumentType { revenue, expense, transfer }

enum FinancialStatus {
  open(Icons.access_time_filled_outlined, 'Open'),
  overdue(Icons.crisis_alert_rounded, 'Overdue'),
  paid(Icons.check_circle_rounded, 'Paid');

  final IconData icon;
  final String text;
  const FinancialStatus(this.icon, this.text);
}

class FinancialDocument {
  late String description;
  late FinancialCategory category;
  late DocumentType documentType;
  late double documentValue;
  late double totalValue;
  late int installmentsNumber;
  late FinancialStatus documentStatus;

  FinancialDocument(
      {required this.description,
      required this.category,
      required this.documentType,
      required this.documentValue,
      required this.totalValue,
      required this.installmentsNumber,
      required this.documentStatus});

  FinancialDocument.empty();
}
