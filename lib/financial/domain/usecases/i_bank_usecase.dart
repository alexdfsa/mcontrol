import 'package:dartz/dartz.dart';
import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

abstract class IBankUseCase {
  Future<Either<Error, List<FinancialBank>>> getList();
  Future<Either<Error, FinancialBank>> get(String code);
  Future<Either<Error, FinancialBank>> patch(FinancialBank entity);
  Future<Either<Error, FinancialBank>> post(FinancialBank entity);
  Future<Either<Error, FinancialBank>> put(FinancialBank entity);
  Future<Either<Error, FinancialBank>> delete(FinancialBank entity);
}
