import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_project/core/errors/failures.dart';
import 'package:mvvm_project/core/utils/api_service.dart';
import 'package:mvvm_project/features/home/data/models/book_model/book_model.dart';
import 'package:mvvm_project/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServer apiServer;
  const HomeRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServer.getBooks(
          endPoint: "volumes", q: "subject:Programming");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiServer.getBooks(
          endPoint: 'volumes',
          q: "computer science");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiServer.getBooks(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance',
          q: "subject:Programming",
          
          );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
