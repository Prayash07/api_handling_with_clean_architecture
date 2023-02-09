import 'package:api_handling_with_clean_architecture/features/posts/data/datasources/remote_data_source.dart';
import 'package:api_handling_with_clean_architecture/features/posts/data/repositories/post_repository_impl.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/repositories/post_repository.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/usecases/fetch_posts.dart';
import 'package:api_handling_with_clean_architecture/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => PostsBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => FetchPosts(locator()));

  // repository
  locator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: locator()));

  // external
  locator.registerLazySingleton(() => Dio());
}
