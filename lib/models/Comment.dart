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


/** This is an auto generated class representing the Comment type in your schema. */
@immutable
class Comment extends Model {
  static const classType = const _CommentModelType();
  final String id;
  final String? _eventId;
  final String? _value;
  final String? _owner;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get eventId {
    try {
      return _eventId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get value {
    return _value;
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Comment._internal({required this.id, required eventId, value, required owner}): _eventId = eventId, _value = value, _owner = owner;
  
  factory Comment({String? id, required String eventId, String? value, required String owner}) {
    return Comment._internal(
      id: id == null ? UUID.getUUID() : id,
      eventId: eventId,
      value: value,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
      id == other.id &&
      _eventId == other._eventId &&
      _value == other._value &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("eventId=" + "$_eventId" + ", ");
    buffer.write("value=" + "$_value" + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Comment copyWith({String? id, String? eventId, String? value, String? owner}) {
    return Comment(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      value: value ?? this.value,
      owner: owner ?? this.owner);
  }
  
  Comment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _eventId = json['eventId'],
      _value = json['value'],
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'eventId': _eventId, 'value': _value, 'owner': _owner
  };

  static final QueryField ID = QueryField(fieldName: "comment.id");
  static final QueryField EVENTID = QueryField(fieldName: "eventId");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
    modelSchemaDefinition.pluralName = "Comments";
    
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
      key: Comment.EVENTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.OWNER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();
  
  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
}