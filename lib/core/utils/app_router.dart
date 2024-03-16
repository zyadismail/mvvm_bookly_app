import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_project/core/utils/service_locator.dart';
import 'package:mvvm_project/features/Search/presentation/views/search_view.dart';
import 'package:mvvm_project/features/Splash/Presentation/veiws/splash_veiw.dart';
import 'package:mvvm_project/features/home/data/models/book_model/book_model.dart';
import 'package:mvvm_project/features/home/data/repos/home_repo_impl.dart';
import 'package:mvvm_project/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:mvvm_project/features/home/presentation/views/book_details_view.dart';
import 'package:mvvm_project/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) =>  BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child:  BookDetailsView(
            bookModel: state.extra as BookModel,// studyyyyyy
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SerachPage(),
      ),
    ],
  );
}
