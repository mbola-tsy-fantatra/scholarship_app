import 'package:flutter/material.dart';
import 'package:scholariship/features/profile/domain/entities/profile.dart';
import 'package:scholariship/features/profile/presentation/widgets/profile_details_row.dart';

import '../../../../core/utils/date_format_utils.dart';

class ProfileItem extends StatelessWidget {
  final ProfileUser profileUser;
  // Static data for demonstration

  ProfileItem({super.key, required  this.profileUser});
  final String profilePictureUrl = '';
  final String name = 'Yor Forger';
  final String bio = 'A passionate developer with a love for coding and innovation.';
  final String dateOfBirth = 'January 1, 1990';
  final String country = 'USA';
  final String studyLevel = 'Master\'s Degree';
  final List<String> desiredStudyCountries = ['Germany', 'Canada', 'Australia'];

  @override
  Widget build(BuildContext context) {
    print('profileUser: $profileUser');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/honami.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              profileUser!.user!.username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              profileUser.bio ?? "Yor",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            ProfileDetailRow(
              icon: Icons.cake,
              label: 'Date of Birth',
              value: profileUser.dateOfBirth != null ? formatDate(profileUser.dateOfBirth!) : dateOfBirth,
            ),
            ProfileDetailRow(
              icon: Icons.flag,
              label: 'Country',
              value: country,
            ),
            ProfileDetailRow(
              icon: Icons.school,
              label: 'Study Level',
              value: studyLevel,
            ),
            ProfileDetailRow(
              icon: Icons.map,
              label: 'Desired Study Countries',
              value: desiredStudyCountries.join(', '),
            ),
          ],
        ),
      ),
    );
  }
}