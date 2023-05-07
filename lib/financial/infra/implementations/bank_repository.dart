import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:dartz/dartz.dart';
import 'package:mcontrol/financial/domain/repositories/i_bank_repository.dart';
import 'package:mcontrol/financial/infra/datasources/i_bank_datasource.dart';

class BankRepository implements IBankRepository {
  final IBankDataSource _dataSource;

  BankRepository(this._dataSource);

  @override
  Future<Either<Exception, FinancialBank>> delete(FinancialBank entity) async {
    try {
      final result = await _dataSource.delete(entity);

      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, List>> get() async {
    try {
      final result = await _dataSource.get();
      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, FinancialBank>> patch(FinancialBank entity) async {
    try {
      final result = await _dataSource.patch(entity);

      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, FinancialBank>> post(FinancialBank entity) async {
    try {
      final result = await _dataSource.post(entity);

      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, FinancialBank>> put(FinancialBank entity) async {
    try {
      final result = await _dataSource.put(entity);

      return Right(result);
    } catch (e) {
      return Left(Exception());
    }
  }
}
