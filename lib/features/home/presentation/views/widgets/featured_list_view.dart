import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_project/core/widgets/custom_error.dart';
import 'package:mvvm_project/core/widgets/loading_widget.dart';
import 'package:mvvm_project/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks!.thumbnail,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksError) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
