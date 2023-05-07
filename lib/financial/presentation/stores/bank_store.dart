import 'package:mcontrol/financial/domain/usecases/i_bank_usecase.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankStore extends MobXStore<List<dynamic>> {
  final IBankUseCase usecase;

  BankStore(this.usecase) : super(<dynamic>[]);

  Future<void> get() async {
    setLoading(true);
    final result = await usecase.get();
    result.fold(
      (l) {
        setError(l);
        setLoading(false);
      },
      update,
    );
  }
}
