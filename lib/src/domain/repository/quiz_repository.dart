import 'package:capp/src/domain/model/new_quiz_model.dart';

abstract class QuizRepository {
  Future<QuizResponse> getQuizList();
}
