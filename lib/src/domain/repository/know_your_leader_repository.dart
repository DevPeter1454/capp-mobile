import 'package:capp/src/domain/model/leader_profile.dart';

abstract class KnowYourLeaderRepository {
  Future<List<LeaderProfile>> getAllLeaders();
  Future<LeaderProfile> getLeaderById(String id);
  Future<LeaderProfile> rateALeader({required String id,required String comment, required double rating});
}
