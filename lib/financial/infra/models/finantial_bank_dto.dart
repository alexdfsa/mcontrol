import 'dart:convert';

import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

class FinancialBankDTO extends FinancialBank {
  FinancialBankDTO({required super.code, required super.name});

  factory FinancialBankDTO.fromMap(Map<String, dynamic> map) {
    return FinancialBankDTO(
      code: map['Code'] ?? '',
      name: map['Name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result
      ..addAll({'Code': code})
      ..addAll({'Name': name});
    return result;
  }

  String toJson() => json.encode(toMap());

  factory FinancialBankDTO.fromJson(String source) => FinancialBankDTO.fromMap(
        json.decode(source),
      );
}
