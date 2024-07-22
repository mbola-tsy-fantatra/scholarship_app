import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/core/routes/router.gr.dart';
import 'package:scholariship/features/onboarding_profile/presentation/views/splash_screen.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/academics_select.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/countries_select.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_provider.dart';


@RoutePage()
class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});
  @override
  InterestScreenState createState() => InterestScreenState();
}

class InterestScreenState extends State<InterestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    if (profileProvider.status == Status.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.replace(const HomeRoute());
      });
    } else if(profileProvider.status == Status.failed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create profile. Please try again.'),
          ),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AcademicInterestsSelect(),
            const SizedBox(height: 24),
            const CountriesSelect(),
            const SizedBox(height: 24),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(onPressed: () async {
                  await profileProvider.saveProfileToBackend();
                }, label: "Create profile", isLoading: profileProvider.status == Status.loading,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
