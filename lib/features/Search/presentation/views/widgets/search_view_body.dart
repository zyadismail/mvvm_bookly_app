import 'package:flutter/material.dart';
import 'package:mvvm_project/features/Search/presentation/views/widgets/search_result_listview.dart';
import 'package:mvvm_project/features/Search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30),
      child:   Column(
        children: [
          CustomSearchTextField(),
          SizedBox(height: 16,),
          Expanded(child: SerachResultListView()),
        ],
      ),
    );
  }
}





