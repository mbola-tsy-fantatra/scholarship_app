import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/core/routes/router.gr.dart';
import 'package:scholariship/features/connection/presentation/index.dart';
import 'package:scholariship/features/connection/presentation/widgets/connection_item.dart';
import '../../../../core/config/injection_container.dart';

@RoutePage()
class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<ConnectionBloc>()..add(const GetConnections(limit: 10, page: 1)),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              title: Text("Connections"),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        context.router.push(const SuggestionRoute());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: Text("Suggestions", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.router.push(const RequestRoute());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: Text("Request", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.router.push(const RequestSentRoute());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: Text("Request sent", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<ConnectionBloc, ConnectionsState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is Loaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ConnectionItemWidget(connectionItem: state.connection.connections[index]);
                      },
                      childCount: state.connection.totalCount,
                    ),
                  );
                } else if (state is ErrorState) {
                  return SliverFillRemaining(
                    child: Center(child: Text('Failed to load scholarships: ${state.message}')),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
