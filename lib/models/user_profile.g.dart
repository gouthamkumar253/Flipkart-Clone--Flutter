// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_users;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltUsers> _$builtUsersSerializer = new _$BuiltUsersSerializer();

class _$BuiltUsersSerializer implements StructuredSerializer<BuiltUsers> {
  @override
  final Iterable<Type> types = const [BuiltUsers, _$BuiltUsers];
  @override
  final String wireName = 'BuiltUsers';

  @override
  Iterable serialize(Serializers serializers, BuiltUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'height',
      serializers.serialize(object.height,
          specifiedType: const FullType(String)),
      'mass',
      serializers.serialize(object.mass, specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltUsers deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltUsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mass':
          result.mass = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltUsers extends BuiltUsers {
  @override
  final String name;
  @override
  final String height;
  @override
  final String mass;
  @override
  final String gender;

  factory _$BuiltUsers([void updates(BuiltUsersBuilder b)]) =>
      (new BuiltUsersBuilder()..update(updates)).build();

  _$BuiltUsers._({this.name, this.height, this.mass, this.gender}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('BuiltUsers', 'name');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('BuiltUsers', 'height');
    }
    if (mass == null) {
      throw new BuiltValueNullFieldError('BuiltUsers', 'mass');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('BuiltUsers', 'gender');
    }
  }

  @override
  BuiltUsers rebuild(void updates(BuiltUsersBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltUsersBuilder toBuilder() => new BuiltUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltUsers &&
        name == other.name &&
        height == other.height &&
        mass == other.mass &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), height.hashCode), mass.hashCode),
        gender.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltUsers')
          ..add('name', name)
          ..add('height', height)
          ..add('mass', mass)
          ..add('gender', gender))
        .toString();
  }
}

class BuiltUsersBuilder implements Builder<BuiltUsers, BuiltUsersBuilder> {
  _$BuiltUsers _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _height;
  String get height => _$this._height;
  set height(String height) => _$this._height = height;

  String _mass;
  String get mass => _$this._mass;
  set mass(String mass) => _$this._mass = mass;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  BuiltUsersBuilder();

  BuiltUsersBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _height = _$v.height;
      _mass = _$v.mass;
      _gender = _$v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltUsers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltUsers;
  }

  @override
  void update(void updates(BuiltUsersBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltUsers build() {
    final _$result = _$v ??
        new _$BuiltUsers._(
            name: name, height: height, mass: mass, gender: gender);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
