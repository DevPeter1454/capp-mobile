import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/mda.dart';
import 'package:capp/src/domain/repository/know_your_mda_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'know_your_mda_state.dart';
part 'know_your_mda_cubit.freezed.dart';

@injectable
class KnowYourMdaCubit extends Cubit<KnowYourMdaState> {
  final KnowYourMdaRepository knowYourMdaRepository;
  KnowYourMdaCubit(this.knowYourMdaRepository) : super(const KnowYourMdaState.initial());

  Future<dynamic> getMdasList() async {
    emit(const KnowYourMdaState.loading());
    try {
      List<Mda> mdas = await knowYourMdaRepository.getMdas();
      emit(KnowYourMdaState.loaded(mdas));
      return mdas;
    } on NetworkException catch (exception) {
      emit(KnowYourMdaState.error(exception.message));
    } catch (e) {
      KnowYourMdaState.error(e.toString());
    }
  }

  Future<dynamic> getMdaById(String id)async{
    emit(const KnowYourMdaState.loading());
    try {
      Mda mda = await knowYourMdaRepository.getMdaById(id);
      emit(KnowYourMdaState.mdaLoaded(mda));
      return mda;
    } on NetworkException catch (exception) {
      emit(KnowYourMdaState.error(exception.message));
    } catch (e) {
      KnowYourMdaState.error(e.toString());
    }
  }
}
