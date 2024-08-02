// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/mda.dart';
import 'package:capp/src/domain/repository/know_your_mda_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: KnowYourMdaRepository)

class KnowYourMdaRepositoryImpl implements KnowYourMdaRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;
  KnowYourMdaRepositoryImpl(
     this.dioClient,
     this.sharedPreferencesService,
  );

  @override
   Future<List<Mda>> getMdas()async{
    try{
      final response = await dioClient.dioGet(ApiConstant.getMdas,
        options: Options(headers: {
          'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
        }));
    final result = response.data["data"];
    print("result $result");
    final List<Mda> convertedList = [];
    //map through result and add each one to convertedList
    result.forEach((element) {
      convertedList.add(Mda.fromMap(element));
    });

    return convertedList;
    } catch (e) {
      log(e.toString());
      return [];
    }

   }

  
}
