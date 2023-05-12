import 'package:mcontrol/core/domain/entities/http_entity_call.dart';
import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:realm/realm.dart';

LocalConfiguration systemConfiguration =
    Configuration.local([SystemConfiguration.schema]);
LocalConfiguration httpEntityCall =
    Configuration.local([HttpEntityCall.schema]);
