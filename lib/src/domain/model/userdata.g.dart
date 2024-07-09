// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      firstname: json['firstname'] as String,
      surname: json['surname'] as String,
      phone: json['phone'] as String,
      state: json['state'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'surname': instance.surname,
      'phone': instance.phone,
      'state': instance.state,
      'email': instance.email,
      'id': instance.id,
    };
