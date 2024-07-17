part of 'rate_leader_cubit.dart';

@freezed
class RateLeaderState with _$RateLeaderState {
  const factory RateLeaderState.initial() = _Initial;
  const factory RateLeaderState.loading() = _Loading;
  const factory RateLeaderState.loaded(LeaderProfile leader) = _Loaded;
  const factory RateLeaderState.error(String message) = _Error;
}
