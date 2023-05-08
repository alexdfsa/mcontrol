import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

abstract class IBankDataSource {
  Future<List<FinancialBank>> getList();
  Future<FinancialBank> get(String code);
  Future<FinancialBank> patch(FinancialBank entity);
  Future<FinancialBank> post(FinancialBank entity);
  Future<FinancialBank> put(FinancialBank entity);
  Future<FinancialBank> delete(FinancialBank entity);
}
