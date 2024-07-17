import 'package:bloc/bloc.dart';
import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/domain/repository/know_your_leader_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'leader_profile_state.dart';
part 'leader_profile_cubit.freezed.dart';
@injectable

class LeaderProfileCubit extends Cubit<LeaderProfileState> {
  final KnowYourLeaderRepository knowYourLeaderRepository;

  LeaderProfileCubit(this.knowYourLeaderRepository) : super(const LeaderProfileState.initial());

  Future<dynamic> getLeaderById({required String id}) async {
    emit(const LeaderProfileState.loading());
    try {
      final leader = await knowYourLeaderRepository.getLeaderById(id);
      emit(LeaderProfileState.loaded(leader));
      return leader;
    } catch (e) {
      emit(LeaderProfileState.error(e.toString()));
    }
  }

}
