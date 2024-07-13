import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/fgn_support_scheme_model.dart';
import 'package:capp/src/domain/repository/fgn_support_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'support_scheme_state.dart';
part 'support_scheme_cubit.freezed.dart';

@injectable
class SupportSchemeCubit extends Cubit<SupportSchemeState> {
  final FgnSupportRepository fgnSupportRepository;
  SupportSchemeCubit(this.fgnSupportRepository)
      : super(const SupportSchemeState.initial());

  Future<dynamic> getSupportSchemes() async {
    print("loaddinin");
    emit(const SupportSchemeState.loading());
    try {
      List<FgnSupportSchemeModel> response =
          await fgnSupportRepository.getSupportSchemes();
      emit(SupportSchemeState.loaded(response));
      print("done loadinginio");
      return response;
    } on NetworkException catch (exception) {
      emit(SupportSchemeState.error(exception.message));
    } catch (e) {
      SupportSchemeState.error(e.toString());
    }
  }
}
