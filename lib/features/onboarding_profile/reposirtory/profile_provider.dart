import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_repository.dart';




class ProfileProvider extends ChangeNotifier {
    File? profileFile;
    String? bio;
    DateTime? dateOfBirth;
    String? countryName;
    List<int>? desiredStudyCountryIds;
    List<int>? academicsInterestIds;
    int? currentStudyLevelId;
    String? currentStudyLevelName;
    bool isFormFilled = false;
    Status status = Status.initial;
    final OnboardingProfileRepository repository;
    final ImagePicker picker = ImagePicker();

    ProfileProvider({required this.repository});

    Future<void> getImageFromGallery() async {
        try {
            XFile? image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
                profileFile = File(image.path);
                notifyListeners();
            }
        } catch (e) {
            throw Exception(e);
        }
    }
    Future<void> getImageFromCamera() async {
        try {
            XFile? image = await picker.pickImage(source: ImageSource.camera);
            if (image != null) {
                profileFile = File(image.path);
                notifyListeners();
            }
        } catch (e) {
            throw Exception(e);
        }
    }
    void updateIsFormFilled() {
        isFormFilled = countryName != null && currentStudyLevelId != null;
    }
    void updateBio(String newBio) {
        bio = newBio;
        notifyListeners();
        _saveProfileData();
    }

    void updateDateOfBirth(DateTime date) {
        dateOfBirth = date;
        notifyListeners();
        _saveProfileData();
    }

    void updateCountry(String name) {
        countryName = name;
        updateIsFormFilled();
        notifyListeners();
        _saveProfileData();
    }

    void updateDesiredStudyCountryIds(List<int> ids) {
        desiredStudyCountryIds = ids;
        notifyListeners();
        _saveProfileData();
    }

    void updateAcademicsInterestIds(List<int> ids) {
        academicsInterestIds = ids;
        notifyListeners();
        _saveProfileData();
    }

    void updateCurrentStudyLevel(int id, String name) {
        currentStudyLevelId = id;
        currentStudyLevelName= name;
        updateIsFormFilled();
        notifyListeners();
        _saveProfileData();
    }

    Future<void> _saveProfileData() async {
        final profileData = {
            'bio': bio,
            'dateOfBirth': dateOfBirth?.toIso8601String(),
            'countryName': countryName,
            'desiredStudyCountryIds': desiredStudyCountryIds,
            'academicsInterestIds': academicsInterestIds,
            'currentStudyLevelId': currentStudyLevelId,
            'profilePicturePath': profileFile?.path,
        };
        await repository.saveProfileDataLocally(profileData);

    }
    Future<void> saveProfileToBackend() async {
        try {
            status = Status.loading;
            notifyListeners();
            final profileData = repository.getProfileDataLocally();
            if (profileData != null) {
                File? profileFile;
                if (profileData['profilePicturePath'] != null) {
                    profileFile = File(profileData['profilePicturePath']);
                }
                await repository.saveProfileDataToBackend(
                    profileFile: profileFile,
                    bio: profileData['bio'],
                    dateOfBirth: profileData['dateOfBirth'] != null ? DateTime.parse(profileData['dateOfBirth']) : null,
                    countryName: profileData['countryName'],
                    desiredStudyCountryIds: List<int>.from(profileData['desiredStudyCountryIds']),
                    academicsInterestIds: List<int>.from(profileData['academicsInterestIds']),
                    currentStudyLevelId: profileData['currentStudyLevelId'],
                );
                status = Status.success;
                notifyListeners();
            } else {
                print('No profile data found locally.');

            }
        } catch (e) {
            status = Status.failed;
            notifyListeners();
            print('Error saving profile to backend: $e');
        }
    }
    void loadProfileData() {
        final profileData = repository.getProfileDataLocally();
        if (profileData != null) {
            bio = profileData['bio'];
            dateOfBirth = DateTime.parse(profileData['dateOfBirth']);
            countryName = profileData['countryName'];
            desiredStudyCountryIds = List<int>.from(profileData['desiredStudyCountryIds']);
            academicsInterestIds = List<int>.from(profileData['academicsInterestIds']);
            currentStudyLevelId = profileData['currentStudyLevelId'];
            final String? profilePicturePath = profileData['profilePicturePath'];
            if (profilePicturePath != null) {
                profileFile = File(profilePicturePath);
            }
            notifyListeners();
        }
    }
}



