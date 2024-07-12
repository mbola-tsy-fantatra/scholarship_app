
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/profile/presentation/index.dart';
import 'package:scholariship/features/profile/presentation/widgets/profile_item.dart';
import 'package:scholariship/global/widgets/loading.dart';

import '../../../../core/config/injection_container.dart';


@RoutePage()
class ProfileScreen extends StatelessWidget {
  final String profileId;
  const ProfileScreen({super.key,@PathParam('profileId') required this.profileId});

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
        title: const Text('Profile'),
      ),
      body: BlocProvider(
        create: (context) => sl<ProfileBloc>()..add(GetUserProfileEvent(userId: profileId)),
        child:
          BlocBuilder<ProfileBloc,ProfileState>(
            builder: (context,state){
              if(state is Loading){
                return const LoadingWidget();
              }else if(state is Loaded){
                return ProfileItem(profileUser: state.user,);
              }else if (state is ErrorState){
                return Text(state.message);
              }
              else{
                return Text("");
              }
            },
          )
        ,
      ),
    );
  }
}
