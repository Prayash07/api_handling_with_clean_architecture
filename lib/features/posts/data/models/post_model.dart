import 'package:api_handling_with_clean_architecture/features/posts/domain/entities/post.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }

  Post toEntity() => Post(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
