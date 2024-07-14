import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_provider.dart';
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';

class AcademicInterestsSelect extends StatelessWidget {
  const AcademicInterestsSelect({super.key});

  void _showMultiSelect(BuildContext context, List<MultiSelectItem<AcademicModel>> items, List<AcademicModel> initialValue, Function(List<AcademicModel>) onConfirm) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: items,
          initialValue: initialValue,
          listType: MultiSelectListType.CHIP,
          onConfirm: onConfirm,
          maxChildSize: 0.8,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Consumer<AcademicsProvider>(builder: (_, provider, child) {
      List<MultiSelectItem<AcademicModel>> items = provider.academics.isNotEmpty
          ? provider.academics.map((academy) => MultiSelectItem<AcademicModel>(academy, academy.title)).toList()
          : [];
      List<AcademicModel> initialValue = profileProvider.academicsInterestIds != null
          ? profileProvider.academicsInterestIds!.map((id) => provider.academics.firstWhere((academy) => academy.id == id)).toList()
          : [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select up to (03) Academic field your are interested in', style: Theme.of(context).textTheme.titleLarge),
          OutlinedButton.icon(
            onPressed: () => _showMultiSelect(context, items, initialValue, (values) {
              if (values.isNotEmpty) {
                List<int> selectedInterestIds = values.map((interest) => interest.id).toList();
                profileProvider.updateAcademicsInterestIds(selectedInterestIds);
              }
            }),
            icon: const Icon(Icons.add),
            label: const Text('Select Academic Interests'),
          ),
          if (initialValue.isNotEmpty)
            Wrap(
              spacing: 8.0,
              children: initialValue.map((interest) => Chip(label: Text(interest.title))).toList(),
            ),
        ],
      );
    });
  }
}