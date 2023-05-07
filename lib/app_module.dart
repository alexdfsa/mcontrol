import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/core/core_module.dart';
import 'package:mcontrol/financial/financial_module.dart';
import 'package:uno/uno.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/core', module: CoreModule()),
        ModuleRoute('/financial', module: FinancialModule()),
      ];
}
