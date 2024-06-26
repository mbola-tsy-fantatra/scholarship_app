import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/index.dart';
import 'package:scholariship/features/scholariship/presentation/manager/country/country_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/manager/studylevel/study_level_bloc.dart';

import '../../../../core/config/injection_container.dart';
import '../widgets/scholarship_creation_form.dart';

@RoutePage()
class ScholarshipCreationScreen extends StatelessWidget {
  const ScholarshipCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        title: const Text('Create Scholarship'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildBody(context),
      ),
    );
  }
MultiBlocProvider buildBody(BuildContext context){
  return
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> sl<ScholarshipBloc>(),),
        BlocProvider(create: (context)=> sl<CountryBloc>(),),
        BlocProvider(create: (context)=> sl<StudyLevelBloc>(),),
      ],
      child: const CreateScholarshipForm(),
    );
}
}


