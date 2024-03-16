import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_project/features/home/data/models/book_model/book_model.dart';
import 'package:mvvm_project/features/home/data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());


  
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewestBooksError(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
