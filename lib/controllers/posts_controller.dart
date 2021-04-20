import 'package:flutter/material.dart';
import 'package:flutter_getx_api/api/posts_provider.dart';
import 'package:flutter_getx_api/models/post_model.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getPosts();
  }

  var posts = <PostModel>[].obs;
  var loading = false.obs;

  PostsProvider _provider = PostsProvider();

  getPosts() async {
    loading(true);
    var response = await _provider.getPosts();
    if (!response.status.hasError) {
      posts.value = postModelFromJson(response.bodyString);
    }
    loading(false);
  }

  sendPost() async {
    loading(true);
    var response = await _provider.sendPost({
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    if (!response.status.hasError) {
      Get.snackbar('Success', 'Post added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    loading(false);
  }
}
