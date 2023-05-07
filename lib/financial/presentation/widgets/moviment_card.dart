import 'package:flutter/material.dart';
import 'package:mcontrol/financial/domain/entities/financial_document.dart';
import 'package:mcontrol/financial/domain/entities/financial_moviment.dart';

class MovimentCard extends StatelessWidget {
  final FinancialMoviment financialMoviment;
  const MovimentCard({super.key, required this.financialMoviment});

  @override
  Widget build(BuildContext context) {
    final iconData = getIcon;
    final backgoundColor = getBackgroundColor;
    final account = financialMoviment.account;
    final description = financialMoviment.financialDocument.description;
    final category = financialMoviment.financialDocument.category.name;
    final documentType = financialMoviment.financialDocument.documentType.name;
    final dueDate = financialMoviment.dueDate;
    final movimentValue = financialMoviment.movimentValue;
    final installment =
        '${financialMoviment.installment}/${financialMoviment.financialDocument.installmentsNumber}';
    final paymentForm = financialMoviment.paymentForm.name;

    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgoundColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              iconData,
              size: 80,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(account),
              const Spacer(),
              Text(description),
              Text(category),
              const Spacer(),
              Text(documentType),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(dueDate.toString()),
              Text(movimentValue.toString()),
              Text(installment),
              Text(paymentForm),
            ],
          ),
        ],
      ),
    );
  }

  IconData get getIcon {
    if (financialMoviment.isPaid) {
      return Icons.check_circle_rounded;
    } else if (financialMoviment.dueDate.isAfter(DateTime.now())) {
      return Icons.watch_later_rounded;
    } else {
      return Icons.crisis_alert_rounded;
    }
  }

  Color get getBackgroundColor {
    switch (financialMoviment.financialDocument.documentType) {
      case DocumentType.revenue:
        return Colors.green.shade100;
      case DocumentType.transfer:
        return Colors.yellow.shade100;
      case DocumentType.expense:
        return Colors.red.shade100;
      default:
        return Colors.blue.shade100;
    }
  }
}
