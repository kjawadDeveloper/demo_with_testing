import 'package:denis/data/posts.dart';
import 'package:denis/pages/posts_list/posts_list.dart';
import 'package:flutter/material.dart';

import '../post_detail.dart';

class PostsItem extends StatelessWidget {
  final Posts posts;

  PostsItem({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            if (MediaQuery.of(context).size.width <= 400)
              return Material(
                child: PostDetails(
                  posts: posts,
                  isMobileView: true,
                ),
              );

            return Material(
              child: PostDetails(
                posts: posts,
                isMobileView: false,
              ),
            );
          },
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 300),
          transitionBuilder: (context, a1, a2, widget) {
            return Stack(
              children: [
                if (MediaQuery.of(context).size.width > 400)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: -400 + (400 * a1.value),
                      child: widget),
                if (MediaQuery.of(context).size.width <= 400)
                  Positioned.fill(
                      child: widget,
                  ),
              ],
            );
          },
        );
      },
      leading: CircleAvatar(
        child: Text(posts.id.toString()),
      ),
      title: Text(
        posts.title,
        maxLines: 1,
      ),
      subtitle: Text(
        posts.body,
        maxLines: 1,
      ),
    );
  }
}
