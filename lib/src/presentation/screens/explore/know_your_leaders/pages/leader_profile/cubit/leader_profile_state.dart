part of 'leader_profile_cubit.dart';

@freezed
class LeaderProfileState with _$LeaderProfileState {
  const factory LeaderProfileState.initial() = _Initial;
  const factory LeaderProfileState.loading() = _Loading;
  const factory LeaderProfileState.loaded(LeaderProfile leader) = _Loaded;
  const factory LeaderProfileState.error(String message) = _Error;
}
