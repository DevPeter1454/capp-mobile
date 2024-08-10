import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/civic_education_model.dart';
import 'package:capp/src/domain/repository/civic_education_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'civic_education_state.dart';
part 'civic_education_cubit.freezed.dart';

@injectable
class CivicEducationCubit extends Cubit<CivicEducationState> {
  final CivicEducationRepository civicEducationRepository;
  CivicEducationCubit(this.civicEducationRepository)
      : super(const CivicEducationState.initial());

  Future<dynamic> getCivicEducation() async {
    emit(const CivicEducationState.loading());
    try {
      List<CivicEducationBookModel> response =
          await civicEducationRepository.getAllCivicEducation();
      emit(CivicEducationState.loaded(response));
      return response;
    } on NetworkException catch (exception) {
      emit(CivicEducationState.error(exception.message));
    }
    catch (e) {
      CivicEducationState.error(e.toString());
    }
  }
}
