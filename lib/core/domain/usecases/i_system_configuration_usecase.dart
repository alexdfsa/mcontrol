import 'package:dartz/dartz.dart';
import 'package:mcontrol/core/domain/entities/system_configuration.dart';

abstract class ISystemConfigurationUseCase {
  Future<Either<Error, SystemConfiguration>> get();
  Future<Either<Error, SystemConfiguration>> save(SystemConfiguration entity);
  Future<Either<Error, void>> delete(SystemConfiguration entity);
}
