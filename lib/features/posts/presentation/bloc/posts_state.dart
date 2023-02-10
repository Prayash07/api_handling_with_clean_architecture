// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitialState extends PostsState {}

class PostHasDataState extends PostsState {
  final List<Post> posts;
  const PostHasDataState({
    required this.posts,
  });

  @override
  List<Object> get props => [posts];
}

class PostErrorState extends PostsState {
  final String message;
  const PostErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
