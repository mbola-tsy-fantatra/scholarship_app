import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/core/model/country_model.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_provider.dart';


class CountriesSelect extends StatelessWidget {
  const CountriesSelect({super.key});

  void _showMultiSelect(
      BuildContext context,
      List<MultiSelectItem<CountryModel>> items,
      List<CountryModel> initialValue,
      Function(List<CountryModel>) onConfirm) async {
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
    return Consumer<CountryProvider>(builder: (_, provider, child) {
      List<MultiSelectItem<CountryModel>> items = provider.countries.isNotEmpty
          ? provider.countries
              .map((country) =>
                  MultiSelectItem<CountryModel>(country, country.name))
              .toList()
          : [];
      List<CountryModel> initialValue =
          profileProvider.desiredStudyCountryIds != null
              ? profileProvider.desiredStudyCountryIds!
                  .map((id) => provider.countries
                      .firstWhere((country) => country.countryId == id))
                  .toList()
              : [];

      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Select up to 5 countries you want to pursue your study',
              style: Theme.of(context).textTheme.titleLarge),
          OutlinedButton.icon(
            onPressed: () => _showMultiSelect(context, items, initialValue, (values) {
              if (values.isNotEmpty) {
                List<int> selectedCountryIds = values.map((country) => country.countryId).toList();
                profileProvider.updateDesiredStudyCountryIds(selectedCountryIds);
              }
            }),
            icon: const Icon(Icons.add),
            label: const Text('Select Study Countries'),
          ),
          if (initialValue.isNotEmpty)
            Wrap(
              spacing: 8.0,
              children: initialValue
                  .map((country) => Chip(label: Text(country.name)))
                  .toList(),
            ),
        ],
      );
    });
  }
}
