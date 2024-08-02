part of 'know_your_mda_cubit.dart';

@freezed
class KnowYourMdaState with _$KnowYourMdaState {
  const factory KnowYourMdaState.initial() = _Initial;
  const factory KnowYourMdaState.loading() = _Loading;
  const factory KnowYourMdaState.loaded(List<Mda> mdas) = _Loaded;
  const factory KnowYourMdaState.error(String message) = _Error;
}
