import 'package:flutter/material.dart';

import '../widget/custom_search_text_form_filed.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        children: [
          CustomSearchTextFormFiled(),
        ],
      ),
    ));
  }
}
