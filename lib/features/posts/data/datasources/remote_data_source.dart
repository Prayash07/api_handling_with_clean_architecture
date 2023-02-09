import 'dart:convert';

import 'package:api_handling_with_clean_architecture/features/posts/data/exception.dart';
import 'package:api_handling_with_clean_architecture/features/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<PostModel> getPost();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<PostModel> getPost() async {
    final Response response =
        await dio.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
