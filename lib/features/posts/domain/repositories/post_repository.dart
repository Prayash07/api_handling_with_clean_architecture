import 'package:api_handling_with_clean_architecture/features/posts/data/failure.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, Post>> fetchPostRepository();
}
