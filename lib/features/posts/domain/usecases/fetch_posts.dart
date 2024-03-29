import 'package:api_handling_with_clean_architecture/features/posts/data/failure.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/entities/post.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchPosts {
  final PostRepository fetchPostRepository;

  FetchPosts(this.fetchPostRepository);

  Future<Either<Failure, List<Post>>> execute() {
    return fetchPostRepository.fetchPostRepository();
  }
}
