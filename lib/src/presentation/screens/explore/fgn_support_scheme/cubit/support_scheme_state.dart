part of 'support_scheme_cubit.dart';

@freezed
class SupportSchemeState with _$SupportSchemeState {
  const factory SupportSchemeState.initial() = _Initial;
  const factory SupportSchemeState.loading() = _Loading;
  const factory SupportSchemeState.loaded(List<FgnSupportSchemeModel> supportSchemes) = _Loaded;
  const factory SupportSchemeState.error(String message) = _Error;
}
