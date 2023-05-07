import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/core/presentation/configuration_page.dart';
import 'package:mcontrol/core/presentation/home_page.dart';

class CoreModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const HomePage())),
        ChildRoute('/home', child: ((context, args) => const HomePage())),
        ChildRoute('/config',
            child: ((context, args) => const ConfigurationPage())),
      ];
}
