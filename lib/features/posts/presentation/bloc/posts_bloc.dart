import 'package:api_handling_with_clean_architecture/features/posts/domain/entities/post.dart';
import 'package:api_handling_with_clean_architecture/features/posts/domain/usecases/fetch_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FetchPosts _fetchPosts;

  PostsBloc(this._fetchPosts) : super(PostsInitialState()) {
    on<FetchPostDataEvent>((event, emit) async {
      final result = await _fetchPosts.execute();
      if (kDebugMode) {
        print("posts $result");
      }

      // result.fold(
      //   (failure) => emit(const PostErrorState(message: "failure")),
      //   (data) => emit(
      //     PostHasDataState(posts: data),
      //   ),
      // );

      emit(
        result.fold((failure) => const PostErrorState(message: "failure"),
            (data) => PostHasDataState(posts: data)),
      );
    });
  }
}
