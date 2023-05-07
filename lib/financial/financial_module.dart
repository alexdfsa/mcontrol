import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/financial/external/datasources/mendix/bank_datasource.dart';
import 'package:mcontrol/financial/infra/implementations/bank_repository.dart';
import 'package:mcontrol/financial/infra/implementations/bank_usecase.dart';
import 'package:mcontrol/financial/presentation/pages/bank_page.dart';
import 'package:mcontrol/financial/presentation/pages/financial_account_page.dart';
import 'package:mcontrol/financial/presentation/stores/bank_store.dart';

class FinancialModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => BankUseCase(i())),
        Bind((i) => BankDataSource(i())),
        Bind((i) => BankRepository(i())),
        Bind((i) => BankStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/bank', child: ((context, args) => const BankPage())),
        ChildRoute('/financialAccount',
            child: ((context, args) => const FinancialAccountPage())),
      ];
}
