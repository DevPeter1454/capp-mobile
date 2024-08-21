import 'package:capp/src/domain/model/complaint.dart';
import 'package:capp/src/domain/model/mda.dart';

abstract class KnowYourMdaRepository {
  Future<List<Mda>> getMdas();

  Future<Mda> getMdaById(String id);

  Future<Complaint> lodgeAComplaint(Complaint complaint);
}
