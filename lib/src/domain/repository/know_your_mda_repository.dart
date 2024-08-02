import 'package:capp/src/domain/model/mda.dart';

abstract class KnowYourMdaRepository {
  Future<List<Mda>> getMdas();
}
