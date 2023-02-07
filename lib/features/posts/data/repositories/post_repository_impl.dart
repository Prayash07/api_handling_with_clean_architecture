// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:api_handling_with_clean_architecture/features/posts/data/exception.dart';
import 'package:dartz/dartz.dart';

import 'package:api_handling_with_clean_architecture/features/posts/data/datasources/remote_data_source.dart';
import 'package:api_handling_with_clean_architecture/features/posts/data/failure.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/entities/post.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final RemoteDataSource remoteDataSource;
  PostRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Post>> fetchPostRepository() async {
    try {
      final result = await remoteDataSource.getPost();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
