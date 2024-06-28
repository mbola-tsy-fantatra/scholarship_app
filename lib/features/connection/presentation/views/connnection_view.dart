import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/core/routes/router.gr.dart';
import 'package:scholariship/features/connection/domain/entities/connnection_item.dart';
import 'package:scholariship/features/connection/presentation/index.dart';

import '../../../../core/config/injection_container.dart';

@RoutePage()
class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=> sl<ConnectionBloc>(),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              title: Row(
                children: [
                  Text("Connections")
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                 Padding(
                  padding: const EdgeInsets.all(16),
                    child:
                    Row(
                      children: [
                           InkWell(
                             onTap: (){
                               context.router.push(const RequestRoute());
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                   color: Colors.grey.withOpacity(0.3),
                                   borderRadius: BorderRadius.circular(10.0)
                               ),
                               // decoration: ,
                               child:  const Padding(
                                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                   child: Text("Request ",style: TextStyle(fontSize: 18),)
                               ),
                             ),
                           ),
                          const SizedBox(width: 20 ,),
                          InkWell(
                            onTap: (){
                                context.router.push(const RequestSentRoute());
                            },
                            child:Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              // decoration: ,
                              child:  const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                  child: Text("Request sent",style: TextStyle(fontSize: 18),)
                              ),
                            ),
                          )
                      ],
                    )
              )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
