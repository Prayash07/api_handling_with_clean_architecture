import 'package:api_handling_with_clean_architecture/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:api_handling_with_clean_architecture/features/posts/presentation/widgets/post_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Posts list page"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (kDebugMode) {
            print("Posts state $state");
          }
          if (state is PostHasDataState) {
            return ListView.builder(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 50,
              ),
              itemBuilder: (context, index) {
                return PostCard(
                  title: state.posts[index].title,
                  description: state.posts[index].body,
                );
              },
              itemCount: state.posts.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
