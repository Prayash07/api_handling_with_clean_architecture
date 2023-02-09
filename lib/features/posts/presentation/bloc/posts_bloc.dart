import 'package:api_handling_with_clean_architecture/features/posts/domain/usecases/fetch_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FetchPosts _fetchPosts;

  PostsBloc(this._fetchPosts) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
