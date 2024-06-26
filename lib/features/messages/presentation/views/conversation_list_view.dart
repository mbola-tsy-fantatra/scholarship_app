
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 16.0),
         child: const Column(
          children: [
              SearchInput()
          ],
         ),
      )
      );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
                 color: Colors.grey[200],
                 borderRadius: BorderRadius.circular(25.0),
              ),
              
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your chat",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search_outlined),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)
          ),
      ),
    );
  }
}