import 'package:bloc/bloc.dart';
import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/domain/repository/know_your_leader_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'rate_leader_state.dart';
part 'rate_leader_cubit.freezed.dart';
@injectable

class RateLeaderCubit extends Cubit<RateLeaderState> {
  final KnowYourLeaderRepository knowYourLeaderRepository;

  RateLeaderCubit(this.knowYourLeaderRepository) : super(const RateLeaderState.initial());

  Future<dynamic> rateLeader({required String id, required double rating, required String comment}) async {
    emit(const RateLeaderState.loading());
    try {
      final leader = await knowYourLeaderRepository.rateALeader(id: id, rating: rating, comment: comment);
      emit(RateLeaderState.loaded(leader));
      return leader;
    } catch (e) {
      emit(RateLeaderState.error(e.toString()));
    }
  }
}
