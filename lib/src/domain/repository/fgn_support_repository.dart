import 'package:capp/src/domain/model/fgn_support_scheme_model.dart';

abstract class FgnSupportRepository {
  Future<List<FgnSupportSchemeModel>> getSupportSchemes();
}
