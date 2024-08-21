import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/complaint.dart';
import 'package:capp/src/domain/repository/know_your_mda_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'lodge_a_complaint_state.dart';
part 'lodge_a_complaint_cubit.freezed.dart';

@injectable
class LodgeAComplaintCubit extends Cubit<LodgeAComplaintState> {
  final KnowYourMdaRepository knowYourMdaRepository;

  LodgeAComplaintCubit(this.knowYourMdaRepository)
      : super(const LodgeAComplaintState.initial());

  Future<dynamic> lodgeComplaint(Complaint complaint) async {
    emit(const LodgeAComplaintState.loading());
    try {
      Complaint result = await knowYourMdaRepository.lodgeAComplaint(complaint);
      if (result.complain.isEmpty) {
        emit(const LodgeAComplaintState.error("Error"));
      } else {
        emit(LodgeAComplaintState.loaded(result));
      }
    } on NetworkException catch (exception) {
      emit(LodgeAComplaintState.error(exception.message));
    } catch (e) {
      LodgeAComplaintState.error(e.toString());
    }
  }
}
