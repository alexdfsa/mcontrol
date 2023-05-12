// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_configuration.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SystemConfiguration extends _SystemConfiguration
    with RealmEntity, RealmObjectBase, RealmObject {
  SystemConfiguration(
    String themeModeName, {
    DateTime? syncDate,
  }) {
    RealmObjectBase.set(this, 'themeModeName', themeModeName);
    RealmObjectBase.set(this, 'syncDate', syncDate);
  }

  SystemConfiguration._();

  @override
  String get themeModeName =>
      RealmObjectBase.get<String>(this, 'themeModeName') as String;
  @override
  set themeModeName(String value) =>
      RealmObjectBase.set(this, 'themeModeName', value);

  @override
  DateTime? get syncDate =>
      RealmObjectBase.get<DateTime>(this, 'syncDate') as DateTime?;
  @override
  set syncDate(DateTime? value) => RealmObjectBase.set(this, 'syncDate', value);

  @override
  Stream<RealmObjectChanges<SystemConfiguration>> get changes =>
      RealmObjectBase.getChanges<SystemConfiguration>(this);

  @override
  SystemConfiguration freeze() =>
      RealmObjectBase.freezeObject<SystemConfiguration>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SystemConfiguration._);
    return const SchemaObject(
        ObjectType.realmObject, SystemConfiguration, 'SystemConfiguration', [
      SchemaProperty('themeModeName', RealmPropertyType.string),
      SchemaProperty('syncDate', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}
