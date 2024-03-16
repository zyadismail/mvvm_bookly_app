import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/features/home/data/models/book_model/book_model.dart';

import 'package:mvvm_project/features/home/presentation/views/widgets/similar_books_section.dart';

import 'books_details_sectioni.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key, required this.bookModel,
  });


  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return    CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const   CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
              const   Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
               const   SimilarBooksSection(),
              const   SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
