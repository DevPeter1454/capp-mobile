part of 'add_new_collection_cubit.dart';

@freezed
class AddNewCollectionState with _$AddNewCollectionState {
  const factory AddNewCollectionState.initial() = _Initial;
  const factory AddNewCollectionState.loading() = _Loading;
  const factory AddNewCollectionState.loaded(CollectionModel collection) = _Loaded;
  const factory AddNewCollectionState.error(String message) = _Error;
}
