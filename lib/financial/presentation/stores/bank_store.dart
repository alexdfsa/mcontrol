import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/domain/usecases/i_bank_usecase.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankStore extends MobXStore<FinancialBank> {
  final IBankUseCase usecase;

  BankStore(this.usecase) : super(FinancialBank(code: '', name: ''));

  Future<void> get(String code) async {
    setLoading(true);
    if (code.isNotEmpty) {
      final result = await usecase.get(code);
      result.fold(
        (l) {
          setError(l);
          setLoading(false);
        },
        update,
      );
    } else {
      setLoading(false);
      update;
    }
  }
}
