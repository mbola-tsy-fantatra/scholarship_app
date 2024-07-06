import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/onboarding_profile/presentation/views/splash_screen.dart';
import 'package:scholariship/features/onboarding_profile/presentation/widgets/profile_widget.dart';

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

class TopDesign extends StatelessWidget {
  final double height;

  const TopDesign({required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: height * 0.25,
        child: Stack(
          children: [
            Positioned(
              top: 75,
              left: 0,
              child: Transform.rotate(
                angle: -18,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75,
              right: 0,
              child: Transform.rotate(
                angle: -12,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: paint(Colors.white.withOpacity(0.1), 25.0, 10.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  final double height;

  const ProfileSection({super.key, required this.height});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: widget.height * 0.22 - 50,
          left: 16,
          child: ProfileWidget(onClicked: () {}),
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
                      'Introduce yourself .',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text('Select your country',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                showCountryPickerWidget(context, (value) {
                                  print(value);
                                }, widget.height * 0.4);
                              },
                              icon: const Icon(Icons.arrow_drop_down)),
                          hintText: 'Your country',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                ButtonWidget(onPressed: () {}, label: 'Next')
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
          padding: const  EdgeInsets.all(22)
      ),
      useSafeArea: true,
      moveAlongWithKeyboard: true);
}
