import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/suggestion/suggestion_bloc.dart';
import 'package:scholariship/features/connection/presentation/widgets/request_suggestion_item.dart';

import '../../../../core/config/injection_container.dart';


@RoutePage()
class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

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
          title: const Text('Request'),
        ),
        body: BlocProvider(
          create: (context)=> sl<SuggestionBloc>()..add(GetSuggestionEvent()),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<SuggestionBloc,SuggestionState>
              (
                builder: (context,state){
                  if(state is Loading){
                    return const Center(child: CircularProgressIndicator());
                  }else if(state is Loaded){
                    return ListView.builder(
                        itemCount: state.profiles.length,
                        itemBuilder: (context,index){
                          return RequestSuggestionItem(profile: state.profiles[index]);
                        }
                    );
                  }else if(state is ErrorState){
                    return Center(child: Text('Failed to load scholarships: ${state.message}'));
                  }else{
                    return Container();
                  }
                }
            ),
          ),
        )
    );
  }
}
