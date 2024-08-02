part of 'political_party_cubit.dart';

@freezed
class PoliticalPartyState with _$PoliticalPartyState {
  const factory PoliticalPartyState.initial() = _Initial;
  const factory PoliticalPartyState.loading() = _Loading;
  const factory PoliticalPartyState.loaded(List<NewPoliticalPartyModel> politicalParties) = _Loaded;
  const factory PoliticalPartyState.joined(NewPoliticalPartyModel party) = _Joined;
  const factory PoliticalPartyState.error(String message) = _Error;
}
