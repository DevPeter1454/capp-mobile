import 'package:capp/src/domain/model/new_political_party_model.dart';

abstract class PoliticalPartyRepository {
  Future<List<NewPoliticalPartyModel>> getParties();

  Future<NewPoliticalPartyModel> joinAParty({required String id, required int age, required String occupation});
  Future<NewPoliticalPartyModel> donateToParty({required String id, required int amount,});


}
