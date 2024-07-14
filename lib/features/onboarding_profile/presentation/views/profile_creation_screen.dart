import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/profile_section.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/top_design.dart';

@RoutePage()
class ProfileCreationScreen extends StatelessWidget {
  final String userId;
  const ProfileCreationScreen({
    super.key,
    @PathParam('userId') required this.userId,
  });
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          TopDesign(height: height),
          ProfileSection(height: height),
        ],
      )),
    );
  }
}





