import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/config/injection_container.dart';
import '../../../../core/routes/router.gr.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/studyLevel.dart';
import '../manager/country/country_bloc.dart';
import '../manager/scholarship/scholarship_bloc.dart';
import '../manager/studylevel/study_level_bloc.dart';
import '../widgets/scholarship_item.dart';

@RoutePage()
class ScholarshipScreen extends StatelessWidget {
  const ScholarshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CountryBloc>()),
        BlocProvider(create: (context) => sl<StudyLevelBloc>()),
        BlocProvider(create: (context) => sl<ScholarshipBloc>()),
      ],
      child: const ScholarshipSearchPage(),
    );
  }
}

class ScholarshipSearchPage extends StatefulWidget {
  const ScholarshipSearchPage({super.key});

  @override
  _ScholarshipSearchPageState createState() => _ScholarshipSearchPageState();
}

class _ScholarshipSearchPageState extends State<ScholarshipSearchPage> {
  String? selectedCountry;
  String? selectedStudyLevel;
  TextEditingController queryController = TextEditingController();
  bool showFilters = false; // State to toggle visibility of filters

  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(GetCountryEvent());
    context.read<StudyLevelBloc>().add(GetStudyLevelEvent());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _search();
    });
  }

  void _search() {
    if (selectedCountry != null && selectedStudyLevel != null) {
      context.read<ScholarshipBloc>().add(SearchScholarship(
        country: selectedCountry!,
        studyLevel: selectedStudyLevel!,
        query: queryController.text,
      ));
    } else {
      context.read<ScholarshipBloc>().add(const SearchScholarship(
        country: '',
        studyLevel: '',
        query: '',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 25 ,top: 25),  // Padding vertical autour de la Row
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25 ), // Padding vertical autour du TextField
                  child: TextField(
                    controller: queryController,
                    decoration: InputDecoration(
                      labelText: 'Search Field',
                      // border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _search,
                      ),
                    ),
                    onChanged: (_) => _search(),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Add space between TextField and Filter button
              InkWell(
                  onTap: () {
                    setState(() {
                      showFilters = !showFilters;
                    });
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        size: 35,
                        Icons.filter_list,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Filter',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const ScholarshipCreationRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            if (showFilters)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: BlocBuilder<CountryBloc, CountryState>(
                      builder: (context, state) {
                        if (state is CountryLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is CountryLoaded) {
                          return DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text('Country'),
                            value: selectedCountry,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCountry = newValue;
                              });
                              _search();
                            },
                            items: state.country.map<DropdownMenuItem<String>>((Country country) {
                              return DropdownMenuItem<String>(
                                value: country.countryId.toString(),
                                child: Text(country.name),
                              );
                            }).toList(),
                          );
                        } else if (state is CountryErrorState) {
                          return Text('Failed to load countries: ${state.message}');
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Add space between DropdownButtons
                  Expanded(
                    flex: 1,
                    child: BlocBuilder<StudyLevelBloc, StudyLevelState>(
                      builder: (context, state) {
                        if (state is StudyLevelLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is StudyLevelLoaded) {
                          return DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text('Study Level'),
                            value: selectedStudyLevel,
                            onChanged: (newValue) {
                              setState(() {
                                selectedStudyLevel = newValue;
                              });
                              _search();
                            },
                            items: state.studyLevel.map<DropdownMenuItem<String>>((StudyLevel level) {
                              return DropdownMenuItem<String>(
                                value: level.id.toString(),
                                child: Text(level.name),
                              );
                            }).toList(),
                          );
                        } else if (state is StudyLevelErrorState) {
                          return Text('Failed to load study levels: ${state.message}');
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16.0),
            BlocBuilder<ScholarshipBloc, ScholarshipState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const CircularProgressIndicator();
                } else if (state is Loaded) {
                  return Expanded(

                    child:
                    ListView.builder(
                      itemCount: state.scholarships.length,
                      itemBuilder: (context, index) {
                        return ScholarshipItem(
                          id: state.scholarships[index].id,
                          name: state.scholarships[index].name,
                          officialLink: state.scholarships[index].officialLink,
                          description: state.scholarships[index].description,
                          profileUrl: state.scholarships[index].coverPhoto,
                          endApplicationDate: state.scholarships[index].applicationEndDate,
                          fundedType: state.scholarships[index].fundingType,
                          organizationName: state.scholarships[index].organizationName,
                          applicationStartPeriod: state.scholarships[index].applicationStartPeriod,
                          startApplicationDate: state.scholarships[index].applicationEndDate,
                        );
                      },
                    ),
                  );
                } else if (state is ErrorState) {
                  return Text('Failed to load scholarships: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
