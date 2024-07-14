
import 'package:flutter/material.dart';
import 'package:scholariship/core/model/country_model.dart';
import 'package:scholariship/core/model/study_level_model.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_repository.dart';
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';



enum Status { initial , loading, success, failed}

class AcademicsProvider with ChangeNotifier {
  List<AcademicModel> academics = [];
  Status status = Status.initial;
  String? errorMessage;
  final OnboardingProfileRepository repository;

  AcademicsProvider({required this.repository});

  Future<void> getAcademics() async {
    try {
      status = Status.loading;
      notifyListeners();
      academics = await repository.getAcademics();
      status = Status.success;
      notifyListeners();
    } catch (e) {
      status = Status.failed;
      errorMessage = 'Failed to fetch academics: $e';
    } finally {
      notifyListeners();
    }
  }
}

class StudyLevelProvider extends ChangeNotifier {
  List<StudyLevelModel> studyLevels = [];
  Status status = Status.initial;
  String? errorMessage;
  final OnboardingProfileRepository repository;
  StudyLevelProvider({required this.repository});
  Future<void> getStudyLevels() async {
    try {
      status = Status.loading;
      notifyListeners();
      studyLevels = await repository.getStudyLevel();
      status = Status.success;
      notifyListeners();
    } catch (e) {
      status = Status.failed;
      errorMessage = 'Failed to fetch studyLevels: $e';
    } finally {
      notifyListeners();
    }
  }
}


class CountryProvider with ChangeNotifier {
  List<CountryModel> countries = [];
  Status status = Status.initial;
  String? errorMessage;
  final OnboardingProfileRepository repository;

  CountryProvider({required this.repository});

  Future<void> getCountries() async {
    try {
      status = Status.loading;
      notifyListeners();
      countries = await repository.getCountry();
      status = Status.success;
      notifyListeners();
    } catch (e) {
      status = Status.failed;
      errorMessage = 'Failed to fetch countries: $e';
    } finally {
      notifyListeners();
    }
  }
}