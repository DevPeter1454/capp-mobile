part of 'policy_library_cubit.dart';

@freezed
class PolicyLibraryState with _$PolicyLibraryState {
  const factory PolicyLibraryState.initial() = _Initial;
  const factory PolicyLibraryState.loading() = _Loading;
  const factory PolicyLibraryState.loaded(List<CivicEducationBookModel> policyLibrary) = _Loaded;
  const factory PolicyLibraryState.loadedAll(List<CivicEducationBookModel> policyLibrary, List<CollectionModel> collections) = _LoadedAll;
  const factory PolicyLibraryState.error(String message) = _Error;
  const factory PolicyLibraryState.collectionsLoaded(List<CollectionModel> collections) = _CollectionsLoaded;
  // const factory PolicyLibraryState.collectionCreated(CollectionModel collection) = _CollectionCreated;
  const factory PolicyLibraryState.collectionUpdated(CollectionModel collection) = _CollectionUpdated;
}
