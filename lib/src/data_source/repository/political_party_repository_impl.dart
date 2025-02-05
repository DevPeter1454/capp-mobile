import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/new_political_party_model.dart';
import 'package:capp/src/domain/repository/political_party_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PoliticalPartyRepository)
class PoliticalPartyRepositoryImpl implements PoliticalPartyRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  PoliticalPartyRepositoryImpl(this.dioClient, this.sharedPreferencesService);

  @override
  Future<List<NewPoliticalPartyModel>> getParties() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getPoliticalParties,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];

      final List<NewPoliticalPartyModel> convertedList = [];
      //map through result and add each one to convertedList
      result.forEach((element) {
        convertedList.add(NewPoliticalPartyModel.fromMap(element));
      });

      return convertedList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<NewPoliticalPartyModel> joinAParty({
    required String id, 
    required int age, 
    required String occupation,
    required String firstName,
    required String lastName,
    required String gender,
    required String email,
    required String phoneNumber,
    required String countryOfResidence,
    required String stateOfResidence,
    required String lga,
    required String electoralWard,
    required String pollingUnit,
    required String nin,
    }) async {
    try {
      final response = await dioClient.dioPost("${ApiConstant.joinAPoliticalParty}/$id/join",{
        "age":age,
        "occupation":occupation,
        "firstName":firstName,
        "lastName":lastName,
        "gender":gender,
        "email":email,
        "phoneNumber":phoneNumber,
        "countryOfResidence":countryOfResidence,
        "stateOfResidence":stateOfResidence,
        "lga":lga,
        "electoralWard":electoralWard,
        "pollingUnit":pollingUnit,
        "nin":nin,
      },
      options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      
      final result = response.data["data"];
      return NewPoliticalPartyModel.fromMap(result);

    }catch(e){
      log(e.toString());
      return NewPoliticalPartyModel(
        id: "",
        name: "",
        description: "",
        logo: "",
        members: [],
        donations: []
      );
    }
  }

  @override
  Future<NewPoliticalPartyModel> donateToParty({required String id, required int amount}) async {
    try {
      final response = await dioClient.dioPost("${ApiConstant.joinAPoliticalParty}/$id/donate", {"amount": amount},
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));

      final result = response.data["data"];
      return NewPoliticalPartyModel.fromMap(result);
    } catch (e) {
      log(e.toString());
      return NewPoliticalPartyModel(id: "", name: "", description: "", logo: "", members: [], donations: []);
    }
  }
}
