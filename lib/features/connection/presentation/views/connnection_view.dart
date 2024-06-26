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
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),CircleAvatar(
                backgroundColor: Colors.black45,
                child: const Text('AH'),
              ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: const Text('AH'),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
