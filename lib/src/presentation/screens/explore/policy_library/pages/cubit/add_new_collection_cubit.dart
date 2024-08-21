import 'package:bloc/bloc.dart';
import 'package:capp/src/domain/model/collection_model.dart';
import 'package:capp/src/domain/repository/policy_library_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_new_collection_state.dart';
part 'add_new_collection_cubit.freezed.dart';

@injectable
class AddNewCollectionCubit extends Cubit<AddNewCollectionState> {
  final PolicyLibraryRepository policyLibraryRepository;

  AddNewCollectionCubit(this.policyLibraryRepository) : super(const AddNewCollectionState.initial());

  Future<dynamic> createPolicyCollection({
    required String name,
  }) async {
    emit(const AddNewCollectionState.loading());
    try {
      CollectionModel response = await policyLibraryRepository.createPolicyCollection(name: name, description: "No description");
      emit(AddNewCollectionState.loaded(response));
      return response;
    } catch (e) {
      AddNewCollectionState.error(e.toString());
    }
  }
}
