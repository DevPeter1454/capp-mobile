part of 'civic_education_cubit.dart';

@freezed
class CivicEducationState with _$CivicEducationState {
  const factory CivicEducationState.initial() = _Initial;
  const factory CivicEducationState.loading() = _Loading;
  const factory CivicEducationState.loaded(List<CivicEducationBookModel> civicEducation) = _Loaded;
  const factory CivicEducationState.error(String message) = _Error;
}
