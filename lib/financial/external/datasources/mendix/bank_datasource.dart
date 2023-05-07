import 'dart:io';

import 'package:mcontrol/financial/external/datasources/mendix/mendix_config.dart';
import 'package:mcontrol/financial/infra/models/finantial_bank_dto.dart';
import 'package:uno/uno.dart';

import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/infra/datasources/i_bank_datasource.dart';

class BankDataSource implements IBankDataSource {
  late Uno uno;
  final resource =
      '${MendixConfig.baseUrl}/${MendixConfig.oDataServiceVersionSendBox}/Banks';
  final String url =
      'https://mcontrol-sandbox.mxapps.io//odata/Published_OData_service/v1/Banks';
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
      throw Exception(e);
    }
  }

  @override
  Future<List> get() async {
    try {
      //final response = await uno.get(
      //  resource,
      //  headers: {
      //    "Mendix-Username": "alex@chycharry.com.br",
      //    "Mendix-ApiKey": MendixConfig.apiKey,
      //    HttpHeaders.acceptHeader: "*/*",
      //    HttpHeaders.accessControlAllowOriginHeader: "*",
      // },
      //);

      final response = await uno.get(
        validateStatus: (status) {
          print(status);
          return true;
        },
        responseType: ResponseType.json,
        url,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json; charset=utf-8",
          "Mendix-ApiKey": MendixConfig.apiKey,
        },
      );
      if (response.status == 200) {
        // ignore: unnecessary_parenthesis
        final list = ((response.data as List)
            .map(
              (
                e,
              ) =>
                  FinancialBankDTO.fromMap(e),
            )
            .toList());
        return list;
      } else {
        throw Exception();
      }
    } catch (e) {
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
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> post(FinancialBank entity) async {
    try {
      final response = await uno.post(
        resource,
      );
      if (response.status == 201) {
        return FinancialBank(
          code: 'code',
          name: 'name',
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<FinancialBank> put(FinancialBank entity) async {
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
      throw Exception(e);
    }
  }
}
