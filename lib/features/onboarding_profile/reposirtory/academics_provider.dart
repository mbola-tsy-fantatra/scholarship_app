
import 'package:flutter/material.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_repository.dart';
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';
import 'package:scholariship/features/scholariship/data/models/country_model.dart';
import 'package:scholariship/features/scholariship/data/models/study_level_model.dart';


class AcademicsProvider with ChangeNotifier {
  List<AcademicModel>? academics;
  final ProfileRepository repository;

  AcademicsProvider({required this.repository});

  Future<List<AcademicModel>> getAcademics() async {
     return  repository.getAcademics();
  }

  Future<List<CountryModel>> getCountry() async {
    return repository.getCountry();
  }

  Future<List<StudyLevelModel>> getStudyLevels() async {
    return repository.getStudyLevel();
  }
}