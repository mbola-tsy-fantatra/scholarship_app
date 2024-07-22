import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/core/model/study_level_model.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';


class SelectField extends StatelessWidget {
  final Function(int, String)? onChanged;
  final int? selectedValue;

  const SelectField({super.key, this.onChanged, this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudyLevelProvider>(
      builder: (context, provider, child) {
        print(provider.studyLevels.length);
        String selectedName = provider.studyLevels
            .firstWhere((studyLevel) => studyLevel.id == selectedValue,
                orElse: () => const StudyLevelModel(id: -1, name: ''))
            .name;
        return DropdownButtonHideUnderline(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 2.0),
            ),
            child: DropdownButton<int>(
              value: selectedValue,
              hint: Text(
                  selectedName.isEmpty ? 'Select Study Level' : selectedName),
              isExpanded: true,
              items: provider.studyLevels.map((studyLevel) {
                return DropdownMenuItem<int>(
                  value: studyLevel.id,
                  child: Text(studyLevel.name),
                );
              }).toList(),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  String newName = provider.studyLevels
                      .firstWhere((studyLevel) => studyLevel.id == newValue)
                      .name;
                  onChanged?.call(newValue, newName);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
