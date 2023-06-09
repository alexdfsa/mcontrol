import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mcontrol/financial/external/datasources/mendix/mendix_config.dart';
import 'package:mcontrol/financial/infra/models/finantial_bank_dto.dart';
import 'package:uno/uno.dart';

import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/infra/datasources/i_bank_datasource.dart';

class BankDataSource implements IBankDataSource {
  //TODO: remove import 'package:flutter/material.dart';
  late Uno uno;
  final resource =
      '${MendixConfig.baseUrl}/${MendixConfig.oDataServiceVersionSendBox}/Banks';
  final String url =
      'https://mcontrol-sandbox.mxapps.io/odata/Published_OData_service/v1/Banks';
  //final String url =
  //    'http://10.20.30.106:8080/odata/Published_OData_service/v1/Banks';
  BankDataSource(this.uno);

  @override
  Future<FinancialBank> delete(FinancialBank entity) async {
    try {
      //final response = await uno.delete('$resource(${entity.code})');
      final response = await uno.delete(url);
      if (response.status != 404) {
        return FinancialBank(
          code: 'code',
          name: 'name',
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> get(String code) async {
    try {
      final response = await uno.get(
        url,
        params: {},
        headers: {
          "Accept": "*/*",
          "Mendix-ApiKey": MendixConfig.apiKey,
        },
      );
      if (response.status == 200) {
        final list = ((response.data['value'] as List)
            .map(
              (
                e,
              ) =>
                  FinancialBankDTO.fromMap(e),
            )
            .toList());
        return list[0];
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<List<FinancialBank>> getList() async {
    try {
      List<FinancialBank> list = [];

      //final response = await uno.get(
      //  url,
      //  headers: {
      //    "Accept": "*/*",
      //    "Mendix-ApiKey": MendixConfig.apiKey,
      //  },
      //);
      //if (response.status == 200) {
      // final list = ((response.data['value'] as List)
      //     .map(
      //       (
      //         e,
      //       ) =>
      //           FinancialBankDTO.fromMap(e),
      //     )
      //     .toList());
      // return list;
      //} else {
      //  throw Exception();
      //}
      return list;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> patch(FinancialBank entity) async {
    try {
      final response = await uno.patch('$resource(${entity.code})');
      if (response.status != 404) {
        return FinancialBank(
          code: 'code',
          name: 'name',
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> post(FinancialBank entity) async {
    FinancialBankDTO dto =
        FinancialBankDTO(code: entity.code, name: entity.name);
    try {
      final data = jsonEncode(dto);

      final response = await uno.post(url, data: data);
      if (response.status == 201) {
        return FinancialBank(
          code: 'code',
          name: 'name',
        );
      } else {
        debugPrint(response.status.toString());
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> put(FinancialBank entity) async {
    try {
      final data = jsonEncode(entity);
      final response = await uno.put(url, data: data);
      if (response.status != 404) {
        return FinancialBank(
          code: 'code',
          name: 'name',
        );
      } else {
        debugPrint(response.status.toString());
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
