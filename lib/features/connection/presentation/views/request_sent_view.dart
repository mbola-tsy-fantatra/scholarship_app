import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/connection_sent/connection_sent_bloc.dart';
import 'package:scholariship/features/connection/presentation/widgets/request_sent_item.dart';

import '../../../../core/config/injection_container.dart';


@RoutePage()
class RequestSentScreen extends StatelessWidget {
  const RequestSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        title: const Text('Request sent'),
      ),
      body: BlocProvider(
        create: (context)=> sl<ConnectionSentBloc>(),
        child: BlocBuilder<ConnectionSentBloc,ConnectionSentState>(
          builder: (BuildContext context, ConnectionSentState state) {
            if(state is Loading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is Loaded){
              return ListView.builder(
                  itemCount: state.connection.length,
                  itemBuilder: (context,index){
                    return RequestSentItem(connectionSender: state.connection[index],);
                  }
              );
            }else if(state is ErrorState){
              return Center(child: Text('Failed to load scholarships: ${state.message}'));
            }else{
              return Container();
            }
          },

        )
      ),
    );
  }
}
