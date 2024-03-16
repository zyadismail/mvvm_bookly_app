import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/widgets/custom_error.dart';
import 'package:mvvm_project/core/widgets/loading_widget.dart';
import 'package:mvvm_project/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const  EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        }else if(state is NewestBooksError){
          return CustomErrorWidget(errMessage: state.message);
        }else{
          return const LoadingWidget();
        }
      },
    );
  }
}
