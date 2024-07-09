
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userdata.freezed.dart';
part 'userdata.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    required String firstname,
    required String surname,
    required String phone,
    required String state,
    required String email,
    required String id,
  }) = _UserData;
	
  factory UserData.fromJson(Map<String, dynamic> json) =>
			_$UserDataFromJson(json);
}
