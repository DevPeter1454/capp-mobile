// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/domain/repository/know_your_leader_repository.dart';

@Singleton(as: KnowYourLeaderRepository)
class KnowYourLeaderRepositoryImpl implements KnowYourLeaderRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;
  KnowYourLeaderRepositoryImpl(
    this.dioClient,
    this.sharedPreferencesService,
  );

  @override
  Future<List<LeaderProfile>> getAllLeaders() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getLeadersList,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];

      final List<LeaderProfile> convertedList = [];
      //map through result and add each one to convertedList
      result.forEach((element) {
        convertedList.add(LeaderProfile.fromJson(element));
      });
      log("result ${LeaderProfile.fromJson(result[0]).name} ");

      return convertedList;
      // return [LeaderProfile.fromJson(result[0])];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<LeaderProfile> getLeaderById(String id) async {
    try {
      final response = await dioClient.dioGet("${ApiConstant.getALeader}/$id",
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];
      return LeaderProfile.fromJson(result);
    } catch (e) {
      print(e);
      return LeaderProfile(
        id: '',
        url: '',
        name: '',
        title: '',
        allocation: '',
        profile: '',
        responsibility: '',
        lga: '',
        party: '',
        constituency: '',
        ratings: [],
        comments: [],
      );
    }
  }

  @override
  Future<LeaderProfile> rateALeader(
      {required String id,
      required String comment,
      required double rating}) async {
    try {
      final response = await dioClient.dioPost(
        "${ApiConstant.getALeader}/$id/rate",
        {"comment": comment, "rating": rating},
        options: Options(headers: {
          'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
        }),
      );
      final result = response.data["data"];
      return LeaderProfile.fromJson(result);
    } catch (e) {
      print(e);
      return LeaderProfile(
        id: '',
        name: '',
        url: '',
        title: '',
        allocation: '',
        profile: '',
        responsibility: '',
        lga: '',
        constituency: '',
        party: '',
        ratings: [],
        comments: [],
      );
    }
  }
}
