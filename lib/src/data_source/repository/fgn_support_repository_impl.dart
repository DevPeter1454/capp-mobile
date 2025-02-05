import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/fgn_support_scheme_model.dart';
import 'package:capp/src/domain/repository/fgn_support_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FgnSupportRepository)
class FgnSupportRepositoryImpl implements FgnSupportRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  FgnSupportRepositoryImpl(this.dioClient, this.sharedPreferencesService);

  @override
  Future<List<FgnSupportSchemeModel>> getSupportSchemes() async {
    // Existing code...
    // Add a return statement at the end to ensure a non-null value is returned.

    try {
      // Future.delayed(const Duration(seconds: 10));
      final response = await dioClient.dioGet(
          'https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/supports',
          options: Options(headers: {
            'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
          }));
      final result = response.data;
      final List<FgnSupportSchemeModel> supportSchemes = [];
      for (var item in result["data"]) {
        supportSchemes.add(FgnSupportSchemeModel(
            id: item["_id"],
            title: item["title"],
            acronym: FgnSupportSchemeModel.forTest().acronym,
            url: item["url"],
            body: item["body"]));
      }

      return supportSchemes;
    } catch (e) {
      return [];
    }
  }
}
