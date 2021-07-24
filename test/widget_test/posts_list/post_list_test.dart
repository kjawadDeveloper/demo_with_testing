import 'package:denis/data/api_call_response.dart';
import 'package:denis/data/posts.dart';
import 'package:denis/pages/posts_list/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:denis/providers/posts_provider.dart';


main(){



  testWidgets("should show post content", (tester) async {

    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");


    PostsProvider postsProvider = PostsProvider();
    postsProvider.postsSink.add(ApiCallResponse(data: [posts], result: true, message: "Message Fetched", code: 200));

    await tester.pumpWidget(MultiProvider(providers: [

      Provider(create:  (BuildContext context) => PostsProvider(),),

    ],child: Builder(builder: (_) =>  MaterialApp(home: PostList())), ));



    expect(find.text("Demo"), findsOneWidget);
  });



  testWidgets("should show post content", (tester) async {

    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");


    PostsProvider postsProvider = PostsProvider();
    postsProvider.postsSink.add(ApiCallResponse(data: [posts], result: true, message: "Message Fetched", code: 200));

    await tester.pumpWidget(MultiProvider(providers: [
      
      Provider(create:  (BuildContext context) => PostsProvider(),),
      
    ],child: Builder(builder: (_) =>  MaterialApp(home: PostsContent())), ));

    expect(find.text("Demo"), findsOneWidget);
  });




}