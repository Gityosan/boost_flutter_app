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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the UserImage type in your schema. */
@immutable
class UserImage extends Model {
  static const classType = const _UserImageModelType();
  final String id;
  final String? _name;
  final String? _type;
  final int? _size;
  final String? _alt;
  final String? _url;
  final String? _identityId;
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
  
  String? get type {
    return _type;
  }
  
  int? get size {
    return _size;
  }
  
  String? get alt {
    return _alt;
  }
  
  String? get url {
    return _url;
  }
  
  String get identityId {
    try {
      return _identityId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const UserImage._internal({required this.id, name, type, size, alt, url, required identityId, required owner}): _name = name, _type = type, _size = size, _alt = alt, _url = url, _identityId = identityId, _owner = owner;
  
  factory UserImage({String? id, String? name, String? type, int? size, String? alt, String? url, required String identityId, required String owner}) {
    return UserImage._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      type: type,
      size: size,
      alt: alt,
      url: url,
      identityId: identityId,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserImage &&
      id == other.id &&
      _name == other._name &&
      _type == other._type &&
      _size == other._size &&
      _alt == other._alt &&
      _url == other._url &&
      _identityId == other._identityId &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserImage {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("size=" + (_size != null ? _size!.toString() : "null") + ", ");
    buffer.write("alt=" + "$_alt" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("identityId=" + "$_identityId" + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserImage copyWith({String? id, String? name, String? type, int? size, String? alt, String? url, String? identityId, String? owner}) {
    return UserImage(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      size: size ?? this.size,
      alt: alt ?? this.alt,
      url: url ?? this.url,
      identityId: identityId ?? this.identityId,
      owner: owner ?? this.owner);
  }
  
  UserImage.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _type = json['type'],
      _size = (json['size'] as num?)?.toInt(),
      _alt = json['alt'],
      _url = json['url'],
      _identityId = json['identityId'],
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'type': _type, 'size': _size, 'alt': _alt, 'url': _url, 'identityId': _identityId, 'owner': _owner
  };

  static final QueryField ID = QueryField(fieldName: "userImage.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField SIZE = QueryField(fieldName: "size");
  static final QueryField ALT = QueryField(fieldName: "alt");
  static final QueryField URL = QueryField(fieldName: "url");
  static final QueryField IDENTITYID = QueryField(fieldName: "identityId");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserImage";
    modelSchemaDefinition.pluralName = "UserImages";
    
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
      key: UserImage.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.SIZE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.ALT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.IDENTITYID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserImage.OWNER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserImageModelType extends ModelType<UserImage> {
  const _UserImageModelType();
  
  @override
  UserImage fromJson(Map<String, dynamic> jsonData) {
    return UserImage.fromJson(jsonData);
  }
}