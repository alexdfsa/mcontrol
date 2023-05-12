import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:mcontrol/core/domain/usecases/i_system_configuration_usecase.dart';
import 'package:mobx_triple/mobx_triple.dart';

class SystemConfigurationStore extends MobXStore<SystemConfiguration> {
  final ISystemConfigurationUseCase useCase;

  SystemConfigurationStore(this.useCase) : super(SystemConfiguration('System'));

  Future<void> get() async {
    setLoading(true);
    final result = await useCase.get();
    result.fold(
      (l) {
        setError(l);
        setLoading(false);
      },
      update,
    );
  }
}
