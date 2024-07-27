import 'package:bloc/bloc.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/model/collection_model.dart';
import 'package:capp/src/domain/repository/policy_library_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'policy_library_state.dart';
part 'policy_library_cubit.freezed.dart';

@injectable


class PolicyLibraryCubit extends Cubit<PolicyLibraryState> {
  final PolicyLibraryRepository policyLibraryRepository;
  PolicyLibraryCubit(this.policyLibraryRepository) : super(const PolicyLibraryState.initial());

  Future<dynamic> getPolicyLibrary() async {
    emit(const PolicyLibraryState.loading());
    try {
      List<CivicEducationBookModel> response = await policyLibraryRepository.getPolicyList();
      emit(PolicyLibraryState.loaded(response));
      return response;
    } catch (e) {
      PolicyLibraryState.error(e.toString());
    }
  }

  Future<dynamic> getPolicyCollections() async {
    emit(const PolicyLibraryState.loading());
    try {
      List<CollectionModel> response = await policyLibraryRepository.getPolicyCollections();
      emit(PolicyLibraryState.collectionsLoaded(response));
      return response;
    } catch (e) {
      PolicyLibraryState.error(e.toString());
    }
  }

  Future<dynamic> getPolicyAndCollections()async{
    emit(const PolicyLibraryState.loading());
    try {
      List<CivicEducationBookModel> response = await policyLibraryRepository.getPolicyList();
      List<CollectionModel> collections = await policyLibraryRepository.getPolicyCollections();
      emit(PolicyLibraryState.loadedAll(response, collections));
      return [response, collections];
    } catch (e) {
      PolicyLibraryState.error(e.toString());
    }
  }

  

}
