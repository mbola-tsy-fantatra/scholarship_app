import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../global/widgets/custom_button.dart';
import '../../data/request/create_scholarship.dart';
import '../manager/country/country_bloc.dart';
import '../manager/scholarship/scholarship_bloc.dart';
import '../manager/studylevel/study_level_bloc.dart';

class CreateScholarshipForm extends StatefulWidget {
  @override
  _CreateScholarshipFormState createState() => _CreateScholarshipFormState();
}

class _CreateScholarshipFormState extends State<CreateScholarshipForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String officialLink = '';
  String description = '';
  File? coverPhoto;
  String organizationName = '';
  String fundingType = '';
  DateTime startApplicationDate = DateTime.now();
  DateTime endApplicationDate = DateTime.now();
  String applicationStartPeriod = '';
  List<int> hostCountriesIds = [];
  List<int> studyLevelsIds = [];

  void createScholarship() {
    final scholarship = CreateScholarship(
      name: name,
      officialLink: officialLink,
      description: description,
      coverPhoto: coverPhoto!,
      organizationName: organizationName,
      fundingType: fundingType,
      startApplicationDate: startApplicationDate,
      endApplicationDate: endApplicationDate,
      applicationStartPeriod: applicationStartPeriod,
      hostCountriesIds: hostCountriesIds,
      studyLevelsIds: studyLevelsIds,
    );
    BlocProvider.of<ScholarshipBloc>(context).add(CreateScholarshipEvent(createScholarship: scholarship));
  }
  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(GetCountryEvent());
    context.read<StudyLevelBloc>().add(GetStudyLevelEvent());
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      createScholarship();
    }
  }

  Future<void> pickCoverPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        coverPhoto = File(pickedFile.path);
      });
    }
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = isStartDate ? startApplicationDate : endApplicationDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      setState(() {
        if (isStartDate) {
          startApplicationDate = picked;
        } else {
          endApplicationDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ce champ est obligatoire. Veuillez le completer.';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
                decoration: InputDecoration(
                  hintText: "Nom",
                  prefixIcon: const Icon(Icons.text_fields),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  officialLink = value!;
                },
                decoration: InputDecoration(
                  hintText: "Lien officiel",
                  prefixIcon: const Icon(Icons.link),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ce champ est obligatoire. Veuillez le completer.';
                  }
                  return null;
                },
                maxLines: null, // Pour permettre plusieurs lignes
                onSaved: (value) {
                  description = value!;
                },
                decoration: InputDecoration(
                  hintText: "Description",
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: pickCoverPhoto,
                child: const Text('Choisir une photo de couverture'),
              ),
              const SizedBox(height: 12.0),
              coverPhoto == null
                  ? const Text('Aucune photo sélectionnée.')
                  : Image.file(coverPhoto!, height: 100, width: 100),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  organizationName = value!;
                },
                decoration: InputDecoration(
                  hintText: "Nom de l'organisation",
                  prefixIcon: const Icon(Icons.business),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  fundingType = value!;
                },
                decoration: const InputDecoration(
                  hintText: "Type de financement",
                  prefixIcon: Icon(Icons.monetization_on),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () => selectDate(context, true),
                child: const Text('Sélectionner la date de début'),
              ),
              Text('Date de début: ${startApplicationDate.toLocal()}'.split(' ')[0]),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () => selectDate(context, false),
                child: const Text('Sélectionner la date de fin'),
              ),
              Text('Date de fin: ${endApplicationDate.toLocal()}'.split(' ')[0]),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ce champ est obligatoire. Veuillez le completer.';
                  }
                  return null;
                },
                onSaved: (value) {
                  applicationStartPeriod = value!;
                },
                decoration: InputDecoration(
                  hintText: "Période de début des candidatures",
                  prefixIcon: const Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              // Host Countries
              BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return CircularProgressIndicator();
                  } else if (state is CountryLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pays Hôtes', style: TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                          children: state.country.map((country) {
                            return CheckboxListTile(
                              title: Text(country.name),
                              value: hostCountriesIds.contains(country.countryId),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    hostCountriesIds.add(country.countryId);
                                  } else {
                                    hostCountriesIds.remove(country.countryId);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  } else if (state is CountryErrorState) {
                    return Text('Failed to load countries: ${state.message}');
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 12.0),
              // Study Levels
              BlocBuilder<StudyLevelBloc, StudyLevelState>(
                builder: (context, state) {
                  if (state is StudyLevelLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is StudyLevelLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Niveaux d\'étude', style: TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                          children: state.studyLevel.map((level) {
                            return CheckboxListTile(
                              title: Text(level.name),
                              value: studyLevelsIds.contains(level.id),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    studyLevelsIds.add(level.id);
                                  } else {
                                    studyLevelsIds.remove(level.id);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  } else if (state is StudyLevelErrorState) {
                    return Text('Failed to load study levels: ${state.message}');
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 12.0),
              CustomButton(
                label: "Créer une bourse",
                onPressed: submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
