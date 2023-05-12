import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:mcontrol/core/infra/datasources/i_system_configuration_datasource.dart';
import 'package:realm/realm.dart';

class SystemConfigurationDataSource implements ISystemConfigurationDataSource {
  final Realm realm;

  SystemConfigurationDataSource(this.realm);

  @override
  Future<void> delete(SystemConfiguration entity) async {
    return realm.delete(entity);
  }

  @override
  Future<SystemConfiguration> get() async {
    return realm.all<SystemConfiguration>().first;
  }

  @override
  Future<SystemConfiguration> save(SystemConfiguration entity) async {
    return realm.write(() => entity);
  }
}
