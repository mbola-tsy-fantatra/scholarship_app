import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            title: Text('Connections'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),const CircleAvatar(
                backgroundColor: Colors.black45,
                child: Text('AH'),
              ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Text('AH'),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
