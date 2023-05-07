import 'package:dartz/dartz.dart';
import 'package:mcontrol/financial/domain/entities/financial_bank.dart';

abstract class IBankRepository {
  Future<Either<Exception, List<dynamic>>> get();
  Future<Either<Exception, FinancialBank>> patch(FinancialBank entity);
  Future<Either<Exception, FinancialBank>> post(FinancialBank entity);
  Future<Either<Exception, FinancialBank>> put(FinancialBank entity);
  Future<Either<Exception, FinancialBank>> delete(FinancialBank entity);
}
