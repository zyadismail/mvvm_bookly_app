import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_project/core/utils/api_service.dart';
import 'package:mvvm_project/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setUpGetit() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServer>()));  
}
