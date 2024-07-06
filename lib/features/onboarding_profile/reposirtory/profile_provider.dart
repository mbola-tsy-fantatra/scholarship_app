import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_repository.dart';




class ProfileProvider with ChangeNotifier {
    File? profileFile;
    String? bio;
    DateTime? dateOfBirth;
    int? countryId;
    List<int>? desiredStudyCountryIds;
    List<int>? academicsInterestIds;
    int? currentStudyLevelId;
    final ProfileRepository repository;
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

    void updateCountryId(int id) {
        countryId = id;
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

    void updateCurrentStudyLevelId(int id) {
        currentStudyLevelId = id;
        notifyListeners();
        _saveProfileData();
    }

    Future<void> _saveProfileData() async {
        final profileData = {
            'bio': bio,
            'dateOfBirth': dateOfBirth?.toIso8601String(),
            'countryId': countryId,
            'desiredStudyCountryIds': desiredStudyCountryIds,
            'academicsInterestIds': academicsInterestIds,
            'currentStudyLevelId': currentStudyLevelId,
            'profilePicturePath': profileFile?.path,
        };
        await repository.saveProfileDataLocally(profileData);
        await repository.saveProfileDataToBackend(
            profileFile: profileFile,
            bio: bio,
            dateOfBirth: dateOfBirth,
            countryId: countryId!,
            desiredStudyCountryIds: desiredStudyCountryIds!,
            academicsInterestIds: academicsInterestIds!,
            currentStudyLevelId: currentStudyLevelId!,
        );
    }

    void loadProfileData() {
        final profileData = repository.getProfileDataLocally();
        if (profileData != null) {
            bio = profileData['bio'];
            dateOfBirth = DateTime.parse(profileData['dateOfBirth']);
            countryId = profileData['countryId'];
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



