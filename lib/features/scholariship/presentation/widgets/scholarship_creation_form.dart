import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../global/widgets/custom_button.dart';
import '../../data/request/create_scholarship.dart';
import '../manager/country/country_bloc.dart';
import '../manager/scholarship/scholarship_bloc.dart';
import '../manager/studylevel/study_level_bloc.dart';

class CreateScholarshipForm extends StatefulWidget {
  const CreateScholarshipForm({super.key});

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
    print(scholarship);
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
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.text_fields),
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
                decoration: const InputDecoration(
                  hintText: "Tape the official link here",
                  prefixIcon: Icon(Icons.link),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This input is required.';
                  }
                  return null;
                },
                maxLines: null,
                onSaved: (value) {
                  description = value!;
                },
                decoration: const InputDecoration(
                  hintText: "Description",
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 30.0),
              InkWell(
                onTap: pickCoverPhoto,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Choose a cover photo',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              coverPhoto == null
                  ? const Text('No photos selected')
                  : Image.file(coverPhoto!, height: 100, width: 100),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  organizationName = value!;
                },
                decoration: const InputDecoration(
                  hintText: "Organization Name",
                  prefixIcon: Icon(Icons.business),
                ),
              ),
              const SizedBox(height: 30.0),
              DropdownButtonFormField<String>(
                value: applicationStartPeriod.isNotEmpty ? applicationStartPeriod : null,
                items: const [
                  DropdownMenuItem(
                    value: 'every year',
                    child: Text('Every year'),
                  ),
                  DropdownMenuItem(
                    value: 'every two year',
                    child: Text('Every two year'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    applicationStartPeriod = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This input is required.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Select funding type",
                  prefixIcon: Icon(Icons.date_range),
                ),
              ),
              const SizedBox(height: 30.0),
              InkWell(
                onTap: () => selectDate(context, true),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Start date",
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    '${startApplicationDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              InkWell(
                onTap: () => selectDate(context, false),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "End date",
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    '${endApplicationDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              DropdownButtonFormField<String>(
                value: fundingType.isNotEmpty ? fundingType : null,
                items: const [
                  DropdownMenuItem(
                    value: 'FULLY_FUNDED',
                    child: Text('Fully funded'),
                  ),
                  DropdownMenuItem(
                    value: 'PARTIAL_FUNDED',
                    child: Text('Partial funded'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    fundingType = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This input is required.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Select funding type",
                  prefixIcon: Icon(Icons.date_range),
                ),
              ),
              const SizedBox(height: 30.0),
              // Host Countries
              BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CountryLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pays Hôtes', style: TextStyle(fontWeight: FontWeight.bold)),
                        MultiSelectDialogField(
                          items: state.country.map((country) => MultiSelectItem(country.countryId, country.name)).toList(),
                          initialValue: hostCountriesIds,
                          title: const Text("Countries"),
                          buttonText: const Text("Select Countries"),
                          onConfirm: (values) {
                            setState(() {
                              hostCountriesIds = values.cast<int>();
                            });
                          },
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
                        const Text('Study Level', style: TextStyle(fontWeight: FontWeight.bold)),
                        MultiSelectDialogField(
                          items: state.studyLevel.map((level) => MultiSelectItem(level.id, level.name)).toList(),
                          initialValue: studyLevelsIds,
                          title: const Text("Study Levels"),
                          buttonText: const Text("Select Study Levels"),
                          onConfirm: (values) {
                            setState(() {
                              studyLevelsIds = values.cast<int>();
                            });
                          },
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
                label: "Create scholarship",
                onPressed: submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
