import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/model/collection_model.dart';

abstract class PolicyLibraryRepository {
  Future<List<CivicEducationBookModel>> getPolicyList();
  Future<CivicEducationBookModel> getPolicy(String policyId);
  Future<List<CollectionModel>> getPolicyCollections();
  Future<CollectionModel> createPolicyCollection({required String name, required String description});
  Future<CollectionModel> getAPolicyCollection(String collectionId);
  Future<CollectionModel> updatePolicyCollection({required String bookId, required String collectionId});
  Future<void> deletePolicyCollection(String collectionId);
}
