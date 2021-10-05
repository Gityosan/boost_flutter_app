/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _name;
  final String? _introduction;
  final double? _lat;
  final double? _lng;
  final List<String>? _tag;
  final List<String>? _acquaintance;
  final String? _userImageId;
  final UserImage? _icon;
  final UserStatus? _status;
  final List<Event>? _event;
  final String? _owner;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get introduction {
    return _introduction;
  }
  
  double? get lat {
    return _lat;
  }
  
  double? get lng {
    return _lng;
  }
  
  List<String>? get tag {
    return _tag;
  }
  
  List<String>? get acquaintance {
    return _acquaintance;
  }
  
  String get userImageId {
    try {
      return _userImageId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  UserImage? get icon {
    return _icon;
  }
  
  UserStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Event>? get event {
    return _event;
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const User._internal({required this.id, name, introduction, lat, lng, tag, acquaintance, required userImageId, icon, required status, event, required owner}): _name = name, _introduction = introduction, _lat = lat, _lng = lng, _tag = tag, _acquaintance = acquaintance, _userImageId = userImageId, _icon = icon, _status = status, _event = event, _owner = owner;
  
  factory User({String? id, String? name, String? introduction, double? lat, double? lng, List<String>? tag, List<String>? acquaintance, required String userImageId, UserImage? icon, required UserStatus status, List<Event>? event, required String owner}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      introduction: introduction,
      lat: lat,
      lng: lng,
      tag: tag != null ? List<String>.unmodifiable(tag) : tag,
      acquaintance: acquaintance != null ? List<String>.unmodifiable(acquaintance) : acquaintance,
      userImageId: userImageId,
      icon: icon,
      status: status,
      event: event != null ? List<Event>.unmodifiable(event) : event,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _name == other._name &&
      _introduction == other._introduction &&
      _lat == other._lat &&
      _lng == other._lng &&
      DeepCollectionEquality().equals(_tag, other._tag) &&
      DeepCollectionEquality().equals(_acquaintance, other._acquaintance) &&
      _userImageId == other._userImageId &&
      _icon == other._icon &&
      _status == other._status &&
      DeepCollectionEquality().equals(_event, other._event) &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("introduction=" + "$_introduction" + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lng=" + (_lng != null ? _lng!.toString() : "null") + ", ");
    buffer.write("tag=" + (_tag != null ? _tag!.toString() : "null") + ", ");
    buffer.write("acquaintance=" + (_acquaintance != null ? _acquaintance!.toString() : "null") + ", ");
    buffer.write("userImageId=" + "$_userImageId" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? name, String? introduction, double? lat, double? lng, List<String>? tag, List<String>? acquaintance, String? userImageId, UserImage? icon, UserStatus? status, List<Event>? event, String? owner}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      introduction: introduction ?? this.introduction,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      tag: tag ?? this.tag,
      acquaintance: acquaintance ?? this.acquaintance,
      userImageId: userImageId ?? this.userImageId,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      event: event ?? this.event,
      owner: owner ?? this.owner);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _introduction = json['introduction'],
      _lat = (json['lat'] as num?)?.toDouble(),
      _lng = (json['lng'] as num?)?.toDouble(),
      _tag = json['tag']?.cast<String>(),
      _acquaintance = json['acquaintance']?.cast<String>(),
      _userImageId = json['userImageId'],
      _icon = json['icon']?['serializedData'] != null
        ? UserImage.fromJson(new Map<String, dynamic>.from(json['icon']['serializedData']))
        : null,
      _status = enumFromString<UserStatus>(json['status'], UserStatus.values),
      _event = json['event'] is List
        ? (json['event'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Event.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'introduction': _introduction, 'lat': _lat, 'lng': _lng, 'tag': _tag, 'acquaintance': _acquaintance, 'userImageId': _userImageId, 'icon': _icon?.toJson(), 'status': enumToString(_status), 'event': _event?.map((Event? e) => e?.toJson()).toList(), 'owner': _owner
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField INTRODUCTION = QueryField(fieldName: "introduction");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static final QueryField LNG = QueryField(fieldName: "lng");
  static final QueryField TAG = QueryField(fieldName: "tag");
  static final QueryField ACQUAINTANCE = QueryField(fieldName: "acquaintance");
  static final QueryField USERIMAGEID = QueryField(fieldName: "userImageId");
  static final QueryField ICON = QueryField(
    fieldName: "icon",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserImage).toString()));
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField EVENT = QueryField(
    fieldName: "event",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Event).toString()));
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
        ]),
      AuthRule(
        authStrategy: AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Master" ],
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.INTRODUCTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LNG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.TAG,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ACQUAINTANCE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERIMAGEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: User.ICON,
      isRequired: false,
      ofModelName: (UserImage).toString(),
      associatedKey: UserImage.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.EVENT,
      isRequired: false,
      ofModelName: (Event).toString(),
      associatedKey: Event.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.OWNER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}