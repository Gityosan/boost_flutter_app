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


/** This is an auto generated class representing the Event type in your schema. */
@immutable
class Event extends Model {
  static const classType = const _EventModelType();
  final String id;
  final String? _userId;
  final String? _name;
  final String? _eventImageId;
  final EventImage? _image;
  final String? _introduction;
  final List<String>? _tag;
  final double? _lat;
  final double? _lng;
  final int? _limit;
  final int? _reserved;
  final TemporalDateTime? _start;
  final TemporalDateTime? _end;
  final TemporalDateTime? _from;
  final TemporalDateTime? _to;
  final List<Comment>? _comment;
  final bool? _reported;
  final String? _owner;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get name {
    return _name;
  }
  
  String get eventImageId {
    try {
      return _eventImageId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  EventImage? get image {
    return _image;
  }
  
  String? get introduction {
    return _introduction;
  }
  
  List<String>? get tag {
    return _tag;
  }
  
  double? get lat {
    return _lat;
  }
  
  double? get lng {
    return _lng;
  }
  
  int? get limit {
    return _limit;
  }
  
  int? get reserved {
    return _reserved;
  }
  
  TemporalDateTime? get start {
    return _start;
  }
  
  TemporalDateTime? get end {
    return _end;
  }
  
  TemporalDateTime? get from {
    return _from;
  }
  
  TemporalDateTime? get to {
    return _to;
  }
  
  List<Comment>? get comment {
    return _comment;
  }
  
  bool? get reported {
    return _reported;
  }
  
  String get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Event._internal({required this.id, required userId, name, required eventImageId, image, introduction, tag, lat, lng, limit, reserved, start, end, from, to, comment, reported, required owner}): _userId = userId, _name = name, _eventImageId = eventImageId, _image = image, _introduction = introduction, _tag = tag, _lat = lat, _lng = lng, _limit = limit, _reserved = reserved, _start = start, _end = end, _from = from, _to = to, _comment = comment, _reported = reported, _owner = owner;
  
  factory Event({String? id, required String userId, String? name, required String eventImageId, EventImage? image, String? introduction, List<String>? tag, double? lat, double? lng, int? limit, int? reserved, TemporalDateTime? start, TemporalDateTime? end, TemporalDateTime? from, TemporalDateTime? to, List<Comment>? comment, bool? reported, required String owner}) {
    return Event._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      name: name,
      eventImageId: eventImageId,
      image: image,
      introduction: introduction,
      tag: tag != null ? List<String>.unmodifiable(tag) : tag,
      lat: lat,
      lng: lng,
      limit: limit,
      reserved: reserved,
      start: start,
      end: end,
      from: from,
      to: to,
      comment: comment != null ? List<Comment>.unmodifiable(comment) : comment,
      reported: reported,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
      id == other.id &&
      _userId == other._userId &&
      _name == other._name &&
      _eventImageId == other._eventImageId &&
      _image == other._image &&
      _introduction == other._introduction &&
      DeepCollectionEquality().equals(_tag, other._tag) &&
      _lat == other._lat &&
      _lng == other._lng &&
      _limit == other._limit &&
      _reserved == other._reserved &&
      _start == other._start &&
      _end == other._end &&
      _from == other._from &&
      _to == other._to &&
      DeepCollectionEquality().equals(_comment, other._comment) &&
      _reported == other._reported &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Event {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("eventImageId=" + "$_eventImageId" + ", ");
    buffer.write("introduction=" + "$_introduction" + ", ");
    buffer.write("tag=" + (_tag != null ? _tag!.toString() : "null") + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lng=" + (_lng != null ? _lng!.toString() : "null") + ", ");
    buffer.write("limit=" + (_limit != null ? _limit!.toString() : "null") + ", ");
    buffer.write("reserved=" + (_reserved != null ? _reserved!.toString() : "null") + ", ");
    buffer.write("start=" + (_start != null ? _start!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("from=" + (_from != null ? _from!.format() : "null") + ", ");
    buffer.write("to=" + (_to != null ? _to!.format() : "null") + ", ");
    buffer.write("reported=" + (_reported != null ? _reported!.toString() : "null") + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Event copyWith({String? id, String? userId, String? name, String? eventImageId, EventImage? image, String? introduction, List<String>? tag, double? lat, double? lng, int? limit, int? reserved, TemporalDateTime? start, TemporalDateTime? end, TemporalDateTime? from, TemporalDateTime? to, List<Comment>? comment, bool? reported, String? owner}) {
    return Event(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      eventImageId: eventImageId ?? this.eventImageId,
      image: image ?? this.image,
      introduction: introduction ?? this.introduction,
      tag: tag ?? this.tag,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      limit: limit ?? this.limit,
      reserved: reserved ?? this.reserved,
      start: start ?? this.start,
      end: end ?? this.end,
      from: from ?? this.from,
      to: to ?? this.to,
      comment: comment ?? this.comment,
      reported: reported ?? this.reported,
      owner: owner ?? this.owner);
  }
  
  Event.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _name = json['name'],
      _eventImageId = json['eventImageId'],
      _image = json['image']?['serializedData'] != null
        ? EventImage.fromJson(new Map<String, dynamic>.from(json['image']['serializedData']))
        : null,
      _introduction = json['introduction'],
      _tag = json['tag']?.cast<String>(),
      _lat = (json['lat'] as num?)?.toDouble(),
      _lng = (json['lng'] as num?)?.toDouble(),
      _limit = (json['limit'] as num?)?.toInt(),
      _reserved = (json['reserved'] as num?)?.toInt(),
      _start = json['start'] != null ? TemporalDateTime.fromString(json['start']) : null,
      _end = json['end'] != null ? TemporalDateTime.fromString(json['end']) : null,
      _from = json['from'] != null ? TemporalDateTime.fromString(json['from']) : null,
      _to = json['to'] != null ? TemporalDateTime.fromString(json['to']) : null,
      _comment = json['comment'] is List
        ? (json['comment'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _reported = json['reported'],
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'name': _name, 'eventImageId': _eventImageId, 'image': _image?.toJson(), 'introduction': _introduction, 'tag': _tag, 'lat': _lat, 'lng': _lng, 'limit': _limit, 'reserved': _reserved, 'start': _start?.format(), 'end': _end?.format(), 'from': _from?.format(), 'to': _to?.format(), 'comment': _comment?.map((Comment? e) => e?.toJson()).toList(), 'reported': _reported, 'owner': _owner
  };

  static final QueryField ID = QueryField(fieldName: "event.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField EVENTIMAGEID = QueryField(fieldName: "eventImageId");
  static final QueryField IMAGE = QueryField(
    fieldName: "image",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (EventImage).toString()));
  static final QueryField INTRODUCTION = QueryField(fieldName: "introduction");
  static final QueryField TAG = QueryField(fieldName: "tag");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static final QueryField LNG = QueryField(fieldName: "lng");
  static final QueryField LIMIT = QueryField(fieldName: "limit");
  static final QueryField RESERVED = QueryField(fieldName: "reserved");
  static final QueryField START = QueryField(fieldName: "start");
  static final QueryField END = QueryField(fieldName: "end");
  static final QueryField FROM = QueryField(fieldName: "from");
  static final QueryField TO = QueryField(fieldName: "to");
  static final QueryField COMMENT = QueryField(
    fieldName: "comment",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static final QueryField REPORTED = QueryField(fieldName: "reported");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Event";
    modelSchemaDefinition.pluralName = "Events";
    
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
      key: Event.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.EVENTIMAGEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Event.IMAGE,
      isRequired: false,
      ofModelName: (EventImage).toString(),
      associatedKey: EventImage.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.INTRODUCTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.TAG,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.LAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.LNG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.LIMIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.RESERVED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.START,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.END,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.FROM,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.TO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Event.COMMENT,
      isRequired: false,
      ofModelName: (Comment).toString(),
      associatedKey: Comment.EVENTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.REPORTED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.OWNER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _EventModelType extends ModelType<Event> {
  const _EventModelType();
  
  @override
  Event fromJson(Map<String, dynamic> jsonData) {
    return Event.fromJson(jsonData);
  }
}