import 'dart:convert';

import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

class FinancialBankDTO extends FinancialBank {
  FinancialBankDTO({required super.code, required super.name});

  factory FinancialBankDTO.fromMap(Map<String, String> map) {
    return FinancialBankDTO(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result
      ..addAll({'code': code})
      ..addAll({'name': name});
    return result;
  }

  String toJson() => json.encode(toMap());

  factory FinancialBankDTO.fromJson(String source) => FinancialBankDTO.fromMap(
        json.decode(source),
      );
}
