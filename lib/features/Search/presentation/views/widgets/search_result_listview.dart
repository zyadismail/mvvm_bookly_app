import 'package:flutter/material.dart';
import 'package:mvvm_project/features/home/presentation/views/widgets/best_seller_list_view_item.dart';

class SerachResultListView extends StatelessWidget {
  const SerachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(),
          );
        });
  }
}