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
import 'Comment.dart';
import 'Event.dart';
import 'EventImage.dart';
import 'User.dart';
import 'UserImage.dart';

export 'Comment.dart';
export 'Event.dart';
export 'EventImage.dart';
export 'User.dart';
export 'UserImage.dart';
export 'UserStatus.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "05e2e12e29509d1ebceba4e837162d21";
  @override
  List<ModelSchema> modelSchemas = [Comment.schema, Event.schema, EventImage.schema, User.schema, UserImage.schema];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
    case "Comment": {
    return Comment.classType;
    }
    break;
    case "Event": {
    return Event.classType;
    }
    break;
    case "EventImage": {
    return EventImage.classType;
    }
    break;
    case "User": {
    return User.classType;
    }
    break;
    case "UserImage": {
    return UserImage.classType;
    }
    break;
    default: {
    throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
    }
  }
}