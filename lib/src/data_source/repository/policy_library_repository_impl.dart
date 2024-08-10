import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/model/collection_model.dart';
import 'package:capp/src/domain/repository/policy_library_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PolicyLibraryRepository)
class PolicyLibraryRepositoryImpl implements PolicyLibraryRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  PolicyLibraryRepositoryImpl(this.dioClient, this.sharedPreferencesService);

  @override
  Future<List<CivicEducationBookModel>> getPolicyList() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getPolicyList,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;
      // print("result $result");
      final List<CivicEducationBookModel> convertedList = [];
      //map through result and add each one to convertedList
      result.forEach((element) {
        convertedList.add(CivicEducationBookModel.fromMap(element));
      });

      return convertedList;

      // return result.map<CivicEducationBookModel>((json) => CivicEducationBookModel.fromJson(json));
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<CivicEducationBookModel> getPolicy(String policyId) async {
    // TODO: implement getPolicy
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionModel>> getPolicyCollections() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getPolicyCollections,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;

      final List<CollectionModel> convertedList = [];
      //map through result and add each one to convertedList
      result.forEach((element) {
        convertedList.add(CollectionModel.fromMap(element));
      });
      return convertedList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<CollectionModel> createPolicyCollection({required String name, required String description}) async {
    try {
      final response = await dioClient.dioPost(ApiConstant.createPolicyCollection, {"name": name, "description": description},
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;
      return CollectionModel.fromMap(result);
    } catch (e) {
      return CollectionModel(id: "", name: "", description: "", books: []);
    }
  }

  @override
  Future<CollectionModel> getAPolicyCollection(String collectionId) {
    throw UnimplementedError();
  }

  @override
  Future<CollectionModel> updatePolicyCollection({required String bookId, required String collectionId}) async {
    try {
      final response = await dioClient.dioPatch("${ApiConstant.updatePolicyCollection}/$collectionId", {"books": bookId},
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;
      return CollectionModel.fromMap(result);
    } catch (e) {
      print(e.toString);
      return CollectionModel(id: "", name: "", description: "", books: []);
    }
  }

  @override
  Future<void> deletePolicyCollection(String collectionId) async {
    throw UnimplementedError();
  }
}
