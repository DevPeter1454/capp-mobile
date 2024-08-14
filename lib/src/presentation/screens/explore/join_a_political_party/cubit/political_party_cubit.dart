import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/data_source/repository/political_party_repository_impl.dart';
import 'package:capp/src/domain/model/new_political_party_model.dart';
import 'package:capp/src/domain/repository/political_party_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'political_party_state.dart';
part 'political_party_cubit.freezed.dart';

@injectable

class PoliticalPartyCubit extends Cubit<PoliticalPartyState> {
  final PoliticalPartyRepository politicalPartyRepository;
  PoliticalPartyCubit(this.politicalPartyRepository) : super(const PoliticalPartyState.initial());

  Future<dynamic> getPoliticalParties() async {
    emit(const PoliticalPartyState.loading());
    try {
      List<NewPoliticalPartyModel> response = await politicalPartyRepository.getParties();
      emit(PoliticalPartyState.loaded(response));
      return response;
    } on NetworkException catch (exception) {
      emit(PoliticalPartyState.error(exception.message));
    } catch (e) {
      PoliticalPartyState.error(e.toString());
    }
  }

  Future<dynamic> joinAPoliticalParty({required String id, required int age, required String occupation, required String firstName,
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
  })async{
    emit(const PoliticalPartyState.loading());
    try{
     NewPoliticalPartyModel response = await politicalPartyRepository.joinAParty(id:id, age:age, occupation: occupation, firstName:firstName, lastName:lastName, gender:gender, email:email, phoneNumber:phoneNumber, countryOfResidence:countryOfResidence, stateOfResidence:stateOfResidence, lga:lga, electoralWard:electoralWard, pollingUnit:pollingUnit, nin:nin);
     emit(PoliticalPartyState.joined(response));
     return response;
    } on NetworkException catch (exception) {
      emit(PoliticalPartyState.error(exception.message));
    } catch (e) {
      PoliticalPartyState.error(e.toString());
    }
  }

    Future<dynamic> donateToParty({required String id, required int amount, })async{
    emit(const PoliticalPartyState.loading());
    try{
     NewPoliticalPartyModel response = await politicalPartyRepository.donateToParty(id:id, amount:amount);
     emit(PoliticalPartyState.joined(response));
     return response;
    } on NetworkException catch (exception) {
      emit(PoliticalPartyState.error(exception.message));
    } catch (e) {
      PoliticalPartyState.error(e.toString());
    }
  }

}
