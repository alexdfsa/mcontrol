import 'package:realm/realm.dart';

part 'system_configuration.g.dart';

@RealmModel()
class _SystemConfiguration {
  late String themeModeName;
  late DateTime? syncDate;
}
