// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/complaint.dart';
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
  Future<List<Mda>> getMdas() async {
    try {
      final response = await dioClient.dioGet(ApiConstant.getMdas,
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];
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

  @override
  Future<Mda> getMdaById(String id) async {
    try {
      final response = await dioClient.dioGet("${ApiConstant.getMdaById}/$id",
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data["data"];
      final complain = response.data["complains"] ?? [];
      return Mda(
        id: result["_id"],
        ministryName: result["ministry_name"],
        ministerName: result["minister_name"],
        ministryLogo: result["ministry_logo"],
        ministryImage: result["ministry_image"],
        ministryDescription: result["ministry_description"],
        complains:
            complain.map((element) => Complaint.fromMap(element)).toList() ??
                [],
      );
    } catch (e) {
      log(e.toString());
      return Mda(
        id: "",
        ministryName: "",
        ministerName: "",
        ministryLogo: "",
        ministryImage: "",
        ministryDescription: "",
        complains: [],
      );
    }
  }

  @override
  Future<Complaint> lodgeAComplaint(Complaint complaint) async {
    try {
      final response = await dioClient.dioPost(
          ApiConstant.lodgeAComplaint, complaint.toMap(),
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;
      return Complaint.fromMap(result);
    } catch (e) {
      log(e.toString());
      return Complaint(
          createdAt: "",
          id: "",
          mdaId: "",
          firstName: "",
          lastName: "",
          complain: "",
          email: "",
          phone: "",
          gender: "",
          age: "");
    }
  }
}
