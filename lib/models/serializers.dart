library serializers;

//import 'dart:convert';
//import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ecommerce/models/user_profile.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(
  [BuiltUsers]
)
final Serializers serializers=(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();