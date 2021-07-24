import 'package:denis/data/posts.dart';
import 'package:denis/pages/post_detail.dart';
import 'package:denis/pages/posts_list/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("Should show post item on mobile and web", (tester) async {
    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");

    Finder titleFinder = find.text(posts.title);
    Finder bodyFinder = find.text(posts.body);
    Finder idFinder = find.text(posts.id.toString());


    await tester.pumpWidget(MaterialApp(home: Material(child: PostsItem(posts: posts,))));

    await tester.pumpAndSettle();

    expect(idFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });


  testWidgets("Should click on the item detail", (tester) async {
    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");

    Finder titleFinder = find.text(posts.title);
    Finder bodyFinder = find.text(posts.body);
    Finder idFinder = find.text(posts.id.toString());




    await tester.pumpWidget(MaterialApp(home: Material(child: PostsItem(posts: posts,))));

    await tester.pumpAndSettle();

    expect(idFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);



    await tester.tap(titleFinder);

    await tester.pumpAndSettle();

    expect(idFinder, findsNWidgets(2));
    expect(titleFinder, findsNWidgets(2));
    expect(bodyFinder, findsNWidgets(2));


  });



}
