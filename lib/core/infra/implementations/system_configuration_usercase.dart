import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:dartz/dartz.dart';
import 'package:mcontrol/core/domain/repositories/i_system_configuration_repository.dart';
import 'package:mcontrol/core/domain/usecases/i_system_configuration_usecase.dart';

class SystemConfigurationUseCase implements ISystemConfigurationUseCase {
  final ISystemConfigurationRepository _repository;

  SystemConfigurationUseCase(this._repository);

  @override
  Future<Either<Error, void>> delete(SystemConfiguration entity) {
    final results = _repository.delete(entity);
    return results;
  }

  @override
  Future<Either<Error, SystemConfiguration>> get() {
    final results = _repository.get();
    return results;
  }

  @override
  Future<Either<Error, SystemConfiguration>> save(SystemConfiguration entity) {
    final results = _repository.save(entity);
    return results;
  }
}
