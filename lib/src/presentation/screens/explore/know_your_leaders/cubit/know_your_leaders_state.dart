part of 'know_your_leaders_cubit.dart';

@freezed
class KnowYourLeadersState with _$KnowYourLeadersState {
  const factory KnowYourLeadersState.initial() = _Initial;
  const factory KnowYourLeadersState.loading() = _Loading;
  const factory KnowYourLeadersState.loaded(List<LeaderProfile> leaders)=_Loaded;
  const factory KnowYourLeadersState.error(String message) = _Error;
  
  
}
