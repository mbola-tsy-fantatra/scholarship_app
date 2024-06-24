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
      child: ScholarshipSearchPage(),
    );
  }
}

class ScholarshipSearchPage extends StatefulWidget {
  @override
  _ScholarshipSearchPageState createState() => _ScholarshipSearchPageState();
}

class _ScholarshipSearchPageState extends State<ScholarshipSearchPage> {
  String? selectedCountry;
  String? selectedStudyLevel;
  TextEditingController queryController = TextEditingController();

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
    }else{
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
      appBar: AppBar(
        title: const Text('Search Scholarships'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.router.push(const ScholarshipCreationRoute());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<CountryBloc, CountryState>(
              builder: (context, state) {
                if (state is CountryLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CountryLoaded) {
                  return DropdownButton<String>(
                    hint: const Text('Select Country'),
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
            const SizedBox(height: 16.0),
            BlocBuilder<StudyLevelBloc, StudyLevelState>(
              builder: (context, state) {
                if (state is StudyLevelLoading) {
                  return const CircularProgressIndicator();
                } else if (state is StudyLevelLoaded) {
                  return DropdownButton<String>(
                    hint: const Text('Select Study Level'),
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
            SizedBox(height: 16.0),
            TextField(
              controller: queryController,
              decoration: const InputDecoration(
                labelText: 'Search Field',
              ),
              onChanged: (_) => _search(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _search,
              child: const Text('Search Scholarships'),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<ScholarshipBloc, ScholarshipState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const CircularProgressIndicator();
                } else if (state is Loaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.scholarships.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.scholarships[index].name),
                          subtitle: Text(state.scholarships[index].organizationName),
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
