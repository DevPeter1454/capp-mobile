part of 'lodge_a_complaint_cubit.dart';

@freezed
class LodgeAComplaintState with _$LodgeAComplaintState {
  const factory LodgeAComplaintState.initial() = _Initial;

  const factory LodgeAComplaintState.loading() = _Loading;

  const factory LodgeAComplaintState.loaded(Complaint complaint) = _Loaded;

  const factory LodgeAComplaintState.error(String errorMessage) = _Error;
}
