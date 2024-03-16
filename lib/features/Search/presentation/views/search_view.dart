import 'package:flutter/material.dart';
import 'package:mvvm_project/features/Search/presentation/views/widgets/search_view_body.dart';

class SerachPage extends StatelessWidget {
  const SerachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}