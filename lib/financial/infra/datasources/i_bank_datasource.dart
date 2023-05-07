import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

abstract class IBankDataSource {
  Future<List<dynamic>> get();
  Future<FinancialBank> patch(FinancialBank entity);
  Future<FinancialBank> post(FinancialBank entity);
  Future<FinancialBank> put(FinancialBank entity);
  Future<FinancialBank> delete(FinancialBank entity);
}
