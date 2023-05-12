import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/core/external/datasources/realm/system_configuration_datasource.dart';
import 'package:mcontrol/core/external/datasources/realm_config.dart';
import 'package:mcontrol/core/infra/implementations/system_configuration_repository.dart';
import 'package:mcontrol/core/infra/implementations/system_configuration_usercase.dart';
import 'package:mcontrol/core/presentation/configuration_page.dart';
import 'package:mcontrol/core/presentation/home_page.dart';
import 'package:mcontrol/core/presentation/pages/system_configuration_page.dart';
import 'package:mcontrol/core/presentation/stores/system_configuration_store.dart';
import 'package:mcontrol/financial/financial_module.dart';
import 'package:realm/realm.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(systemConfiguration)),
        Bind((i) => SystemConfigurationUseCase(i())),
        Bind((i) => SystemConfigurationDataSource(i())),
        Bind((i) => SystemConfigurationRepository(i())),
        Bind((i) => SystemConfigurationStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const HomePage())),
        ChildRoute('/systemConfiguration',
            child: ((context, args) => const SystemConfigurationPage())),
        ChildRoute('/config',
            child: ((context, args) => const ConfigurationPage())),
        ModuleRoute('/financial', module: FinancialModule()),
      ];
}
