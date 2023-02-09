import 'dart:convert';

import 'package:api_handling_with_clean_architecture/features/posts/data/exception.dart';
import 'package:api_handling_with_clean_architecture/features/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getPost();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getPost() async {
    final Response response =
        await dio.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.data);
      List<PostModel> postModel =
          data.map((e) => PostModel.fromJson(e)).toList();

      return postModel;
    } else {
      throw ServerException();
    }
  }
}
