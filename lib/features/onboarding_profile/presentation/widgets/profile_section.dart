import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/onboarding_profile/presentation/views/splash_screen.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/profile_widget.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/select_field.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_provider.dart';

class ProfileSection extends StatefulWidget {
  final double height;

  const ProfileSection({super.key, required this.height});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StudyLevelProvider>(context, listen: false).getStudyLevels();
    Provider.of<AcademicsProvider>(context, listen: false).getAcademics();
    Provider.of<CountryProvider>(context, listen: false).getCountries();

  }
  @override
  Widget build(BuildContext context) {
    final ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return Stack(
      children: [
        Positioned(
          top: widget.height * 0.22 - 50,
          left: 16,
          child: ProfileWidget(onClicked: () {
             profileProvider.getImageFromGallery();
          }, imageFile: profileProvider.profileFile,),
        ),
        Positioned(
          top: widget.height * 0.35,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Introduce yourself to others and get personalized recommendations .',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Text('Select your country',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                showCountryPickerWidget(context, (value) {
                                   profileProvider.updateCountry(value.name);
                                }, widget.height * 0.5);
                              },
                              icon: const Icon(Icons.arrow_drop_down)),
                          hintText: profileProvider.countryName ?? 'Your country',
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                    ),
                    const SizedBox(height: 16),
                    Text('Select your current study level',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    SelectField(
                      selectedValue: profileProvider.currentStudyLevelId,
                      onChanged: (int newValue, String newName) {
                        profileProvider.updateCurrentStudyLevel(newValue, newName);
                      },
                    ),

                  ],
                ),
                const SizedBox(height: 16),
                ButtonWidget(onPressed: () {
                   context.router.pushNamed('/interest-creation');
                }, label: 'Next', enabled: profileProvider.isFormFilled,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}


void showCountryPickerWidget(
    BuildContext context, Function(Country value) onSelect, double height) {
  showCountryPicker(
      context: context,
      onSelect: (Country value) {
        onSelect(value);
      },
      countryListTheme: CountryListThemeData(
          bottomSheetHeight: height,
          padding: const  EdgeInsets.all(16)
      ),
      useSafeArea: true,
      moveAlongWithKeyboard: true);
}