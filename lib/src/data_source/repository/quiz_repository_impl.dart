import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/new_quiz_model.dart';
import 'package:capp/src/domain/repository/quiz_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: QuizRepository)
class QuizRepositoryImpl implements QuizRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  QuizRepositoryImpl(this.dioClient, this.sharedPreferencesService);

  @override
  Future<QuizResponse> getQuizList() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getQuizList,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];

      return QuizResponse.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      return QuizResponse(data: [], message: "error");
    }
  }
}
