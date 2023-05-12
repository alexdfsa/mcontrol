import 'package:dartz/dartz.dart';
import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:mcontrol/core/domain/repositories/i_system_configuration_repository.dart';
import 'package:mcontrol/core/infra/datasources/i_system_configuration_datasource.dart';

class SystemConfigurationRepository implements ISystemConfigurationRepository {
  final ISystemConfigurationDataSource _dataSource;

  SystemConfigurationRepository(this._dataSource);

  @override
  Future<Either<Error, SystemConfiguration>> get() async {
    try {
      final result = await _dataSource.get();

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, SystemConfiguration>> save(
      SystemConfiguration entity) async {
    try {
      final result = await _dataSource.save(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, void>> delete(SystemConfiguration entity) async {
    try {
      final result = await _dataSource.delete(entity);

      return Right(result);
    } catch (e) {
      return Left(Error());
    }
  }
}
