import 'package:mcontrol/core/domain/entities/system_configuration.dart';

abstract class ISystemConfigurationDataSource {
  Future<SystemConfiguration> get();
  Future<SystemConfiguration> save(SystemConfiguration entity);
  Future<void> delete(SystemConfiguration entity);
}
