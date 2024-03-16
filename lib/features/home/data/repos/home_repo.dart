import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/errors/failures.dart';
import 'package:mvvm_project/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}
//repo pattern:
// bn3ml class abstract
//bn7ded el methods el httnfz 


/* Either = haga mn el atnen
 leftSide = failed, 
 rightSide = success 
*/