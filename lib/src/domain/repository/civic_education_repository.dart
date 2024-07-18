
import 'package:capp/src/domain/model/civic_education_model.dart';

abstract class CivicEducationRepository{
  Future<List<CivicEducationBookModel>> getAllCivicEducation();
  
}