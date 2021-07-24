import 'package:denis/data/api_call_response.dart';
import 'package:denis/data/posts.dart';
import 'package:denis/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'error_widget.dart' as ER;
import 'post_item.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return PostsContent();
  }
}

class PostsContent extends StatefulWidget {
  const PostsContent({Key? key}) : super(key: key);

  @override
  _PostsContentState createState() => _PostsContentState();
}

class _PostsContentState extends State<PostsContent> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<PostsProvider>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title:  Text("Demo"),),
      body: StreamBuilder(
        stream: context.read<PostsProvider>().postsStream,
        builder: (BuildContext context, AsyncSnapshot<ApiCallResponse<dynamic>> snapshot) => buildStreamBody(snapshot),
      ),
    );
  }

  Widget buildStreamBody(AsyncSnapshot<ApiCallResponse<dynamic>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator.adaptive());
    }

    // On Something unexpected
    if (snapshot.data == null) {
      return ER.ErrorWidget(
        message: "Something went wrong",
      );
    }

    // On Api Call error
    if (!snapshot.data!.result) {
      return ER.ErrorWidget(message: snapshot.data!.message);
    }

    ApiCallResponse apiCallResponse = snapshot.data!;

    List<Posts> postsList = apiCallResponse.data;

    return SmartRefresher(
        onRefresh: _onRefresh,
        controller: _refreshController,
        child: ListView.builder(
          itemBuilder: (_, __) => PostsItem(
            posts: postsList[__],
          ),
          itemCount: postsList.length,
        ));
  }

  void _onRefresh() async {
    await context.read<PostsProvider>().getPosts();

    _refreshController.refreshCompleted();
  }
}


