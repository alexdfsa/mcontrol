import 'package:realm/realm.dart';

part 'http_entity_call.g.dart';

@RealmModel()
class _HttpEntityCall {
  late String resource;
  late String method;
  late String body;
  late String response;
  late DateTime requestDate;
  late DateTime synchronizedDate;
  late DateTime expirationDate;
}
