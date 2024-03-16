import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_project/constants.dart';
import 'package:mvvm_project/core/utils/app_router.dart';
import 'package:mvvm_project/core/utils/service_locator.dart';
import 'package:mvvm_project/features/home/data/repos/home_repo_impl.dart';
import 'package:mvvm_project/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:mvvm_project/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setUpGetit();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
