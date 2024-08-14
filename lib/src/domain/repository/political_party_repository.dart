import 'package:capp/src/domain/model/new_political_party_model.dart';

abstract class PoliticalPartyRepository {
  Future<List<NewPoliticalPartyModel>> getParties();

  Future<NewPoliticalPartyModel> joinAParty({required String id, required int age, required String occupation, required String firstName, required String lastName, required String gender, required String email, required String phoneNumber, required String countryOfResidence, required String stateOfResidence, required String lga, required String electoralWard, required String pollingUnit, required String nin,});
  Future<NewPoliticalPartyModel> donateToParty({required String id, required int amount,});


}
