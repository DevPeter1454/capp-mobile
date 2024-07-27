import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/repository/civic_education_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CivicEducationRepository)
class CivicEducationRepositoryImpl implements CivicEducationRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  CivicEducationRepositoryImpl(
    this.dioClient,
    this.sharedPreferencesService,
  );

  @override
  Future<List<CivicEducationBookModel>> getAllCivicEducation() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getCivicEducationList,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];
      print("result $result");

      final List<CivicEducationBookModel> convertedList = [];
      //map through result and add each one to convertedList
      result.forEach((element) {
        convertedList.add(CivicEducationBookModel.fromMap(element));
      });

      return convertedList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
