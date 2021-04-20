import 'package:get/get.dart';

class PostsProvider extends GetConnect {
  Future<Response> getPosts() =>
      get('https://jsonplaceholder.typicode.com/posts');

  Future<Response> sendPost(Map data) => post(
        'https://jsonplaceholder.typicode.com/posts',
        data,
        contentType: 'application/json; charset=UTF-8',
      );
}
