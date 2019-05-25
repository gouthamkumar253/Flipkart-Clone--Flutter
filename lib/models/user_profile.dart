library built_users;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'user_profile.g.dart';

abstract class BuiltUsers implements Built<BuiltUsers, BuiltUsersBuilder> {
  factory BuiltUsers([BuiltUsersBuilder updates(BuiltUsersBuilder b)]) = _$BuiltUsers;

  BuiltUsers._();

  String get name;

  String get height;

  String get mass;

  String get gender;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltUsers.serializer, this));
  }

   BuiltUsers fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltUsers.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltUsers> get serializer => _$builtUsersSerializer;
}
