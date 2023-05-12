import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:dartz/dartz.dart';
import 'package:mcontrol/financial/domain/repositories/i_bank_repository.dart';
import 'package:mcontrol/financial/infra/datasources/i_bank_datasource.dart';

class BankRepository implements IBankRepository {
  final IBankDataSource _dataSource;

  BankRepository(this._dataSource);

  @override
  Future<Either<Error, FinancialBank>> delete(FinancialBank entity) async {
    try {
      final result = await _dataSource.delete(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<FinancialBank>>> getList() async {
    try {
      final result = await _dataSource.getList();
      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, FinancialBank>> get(String code) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Error, FinancialBank>> patch(FinancialBank entity) async {
    try {
      final result = await _dataSource.patch(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, FinancialBank>> post(FinancialBank entity) async {
    try {
      final result = await _dataSource.post(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, FinancialBank>> put(FinancialBank entity) async {
    try {
      final result = await _dataSource.put(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }
}
