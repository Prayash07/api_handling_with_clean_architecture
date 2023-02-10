import 'package:api_handling_with_clean_architecture/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:api_handling_with_clean_architecture/features/posts/presentation/pages/posts_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<PostsBloc>()..add(FetchPostDataEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsListPage(),
      ),
    );
  }
}
