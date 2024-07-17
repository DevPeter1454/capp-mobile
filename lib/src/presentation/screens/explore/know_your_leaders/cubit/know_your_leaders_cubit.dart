import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/domain/repository/know_your_leader_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'know_your_leaders_state.dart';
part 'know_your_leaders_cubit.freezed.dart';

@injectable
class KnowYourLeadersCubit extends Cubit<KnowYourLeadersState> {
  final KnowYourLeaderRepository knowYourLeaderRepository;
  KnowYourLeadersCubit(this.knowYourLeaderRepository)
      : super(const KnowYourLeadersState.initial());

  Future<dynamic> getAllLeaders() async {
    emit(const KnowYourLeadersState.loading());
    try {
      final leaders = await knowYourLeaderRepository.getAllLeaders();
      print(leaders);
      emit(KnowYourLeadersState.loaded(leaders));
      return leaders;
    } on NetworkException catch (exception) {
      emit(KnowYourLeadersState.error(exception.message));
    } catch (e) {
      KnowYourLeadersState.error(e.toString());
    }
  }

  // Future<dynamic> getALeader({required String id})async{
  //   emit(const KnowYourLeadersState.loading());
  //   try {
  //     final leader = await knowYourLeaderRepository.getLeaderById(id);
  //     emit(KnowYourLeadersState.loadLeader(leader));
  //     return leader;
  //   } on NetworkException catch (exception) {
  //     emit(KnowYourLeadersState.error(exception.message));
  //   } catch (e) {
  //     KnowYourLeadersState.error(e.toString());
  //   }
  // }
}
