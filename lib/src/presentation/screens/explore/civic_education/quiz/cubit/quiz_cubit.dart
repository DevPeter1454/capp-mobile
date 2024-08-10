import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/model/new_quiz_model.dart';
import 'package:capp/src/domain/repository/quiz_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'quiz_state.dart';
part 'quiz_cubit.freezed.dart';

@injectable
class QuizCubit extends Cubit<QuizState> {
  final QuizRepository quizRepository;
  QuizCubit(this.quizRepository) : super(const QuizState.initial());

  Future<List<Quiz>> getQuizList() async {
    emit(const QuizState.loading());
    try {
      final response = await quizRepository.getQuizList();
      print("got response ${response.message}");
      emit(QuizState.loaded(response.data));
      return response.data;
    } on NetworkException catch (exception) {
      emit(QuizState.error(exception.message));
      return [];
    } catch (e) {
      QuizState.error(e.toString());
      return [];
    }
  }
}
