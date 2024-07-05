import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/userdata.dart';
import 'package:capp/src/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

@injectable
class UserProfileCubit extends Cubit<UserProfileState> {
  final UserRepository userRepository;
  UserProfileCubit(this.userRepository)
      : super(const UserProfileState.initial());

  Future<void> getUserInfo() async {
    emit(const UserProfileState.loading());
    try {
      UserData response = await userRepository.getUserInfo();
      // print('Parsed UserData: $response');
      emit(UserProfileState.retrieved(response));
    } on NetworkException catch (e) {
      emit(
        UserProfileState.error(e.message),
      );
    } catch (e) {
      emit(
        UserProfileState.error(e.toString()),
      );
    }
  }

  void logOut() async {
    await userRepository.logOut();
  }
}
