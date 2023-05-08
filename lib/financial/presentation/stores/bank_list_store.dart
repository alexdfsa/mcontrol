import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/domain/usecases/i_bank_usecase.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankListStore extends MobXStore<List<FinancialBank>> {
  final IBankUseCase usecase;

  BankListStore(this.usecase) : super(<FinancialBank>[]);

  Future<void> getList() async {
    setLoading(true);
    final result = await usecase.getList();
    result.fold(
      (l) {
        setError(l);
        setLoading(false);
      },
      update,
    );
  }
}
