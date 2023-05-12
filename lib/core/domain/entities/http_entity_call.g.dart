// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_entity_call.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class HttpEntityCall extends _HttpEntityCall
    with RealmEntity, RealmObjectBase, RealmObject {
  HttpEntityCall(
    String resource,
    String method,
    String body,
    String response,
    DateTime requestDate,
    DateTime synchronizedDate,
    DateTime expirationDate,
  ) {
    RealmObjectBase.set(this, 'resource', resource);
    RealmObjectBase.set(this, 'method', method);
    RealmObjectBase.set(this, 'body', body);
    RealmObjectBase.set(this, 'response', response);
    RealmObjectBase.set(this, 'requestDate', requestDate);
    RealmObjectBase.set(this, 'synchronizedDate', synchronizedDate);
    RealmObjectBase.set(this, 'expirationDate', expirationDate);
  }

  HttpEntityCall._();

  @override
  String get resource =>
      RealmObjectBase.get<String>(this, 'resource') as String;
  @override
  set resource(String value) => RealmObjectBase.set(this, 'resource', value);

  @override
  String get method => RealmObjectBase.get<String>(this, 'method') as String;
  @override
  set method(String value) => RealmObjectBase.set(this, 'method', value);

  @override
  String get body => RealmObjectBase.get<String>(this, 'body') as String;
  @override
  set body(String value) => RealmObjectBase.set(this, 'body', value);

  @override
  String get response =>
      RealmObjectBase.get<String>(this, 'response') as String;
  @override
  set response(String value) => RealmObjectBase.set(this, 'response', value);

  @override
  DateTime get requestDate =>
      RealmObjectBase.get<DateTime>(this, 'requestDate') as DateTime;
  @override
  set requestDate(DateTime value) =>
      RealmObjectBase.set(this, 'requestDate', value);

  @override
  DateTime get synchronizedDate =>
      RealmObjectBase.get<DateTime>(this, 'synchronizedDate') as DateTime;
  @override
  set synchronizedDate(DateTime value) =>
      RealmObjectBase.set(this, 'synchronizedDate', value);

  @override
  DateTime get expirationDate =>
      RealmObjectBase.get<DateTime>(this, 'expirationDate') as DateTime;
  @override
  set expirationDate(DateTime value) =>
      RealmObjectBase.set(this, 'expirationDate', value);

  @override
  Stream<RealmObjectChanges<HttpEntityCall>> get changes =>
      RealmObjectBase.getChanges<HttpEntityCall>(this);

  @override
  HttpEntityCall freeze() => RealmObjectBase.freezeObject<HttpEntityCall>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(HttpEntityCall._);
    return const SchemaObject(
        ObjectType.realmObject, HttpEntityCall, 'HttpEntityCall', [
      SchemaProperty('resource', RealmPropertyType.string),
      SchemaProperty('method', RealmPropertyType.string),
      SchemaProperty('body', RealmPropertyType.string),
      SchemaProperty('response', RealmPropertyType.string),
      SchemaProperty('requestDate', RealmPropertyType.timestamp),
      SchemaProperty('synchronizedDate', RealmPropertyType.timestamp),
      SchemaProperty('expirationDate', RealmPropertyType.timestamp),
    ]);
  }
}
