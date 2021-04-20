import 'package:flutter/material.dart';
import 'package:flutter_getx_api/controllers/posts_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Posts'),
            ),
            body: controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: controller.posts
                        .map<Widget>((post) => ListTile(
                              leading: Text(post.id.toString()),
                              title: Text(post.title),
                              subtitle: Text(post.body),
                              trailing: Text('User ${post.userId}'),
                            ))
                        .toList(),
                  ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                controller.sendPost();
              },
            ),
          );
        });
  }
}
