import 'package:denis/data/posts.dart';
import 'package:denis/pages/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("Should show post detail Screen on Mobile Screen", (tester) async {
    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");

    Finder titleFinder = find.text(posts.title);
    Finder bodyFinder = find.text(posts.body);
    Finder idFinder = find.text(posts.id.toString());


    await tester.pumpWidget(MaterialApp(home: Material(child: PostDetails(posts: posts, isMobileView: true))));

    await tester.pumpAndSettle();

    expect(idFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });



  testWidgets("Should show post detail Screen on Website", (tester) async {
    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");

    Finder titleFinder = find.text(posts.title);
    Finder bodyFinder = find.text(posts.body);
    Finder idFinder = find.text(posts.id.toString());

    await tester.pumpWidget(MaterialApp(home: Material(child: PostDetails(posts: posts, isMobileView: false))));

    await tester.pumpAndSettle();

    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
    expect(idFinder, findsOneWidget);

  });



  testWidgets("Should show post detail Screen on Website", (tester) async {
    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");

    Finder titleFinder = find.text(posts.title);
    Finder bodyFinder = find.text(posts.body);
    Finder idFinder = find.text(posts.id.toString());
    Finder tapButtonFinder = find.text("Tap");
    Finder backButtonFinder = find.byIcon(Icons.close);


    await tester.pumpWidget(MaterialApp(home: Builder(
      builder: (context) {
        return RaisedButton(
          child: Text("Tap"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Material(child: PostDetails(posts: posts, isMobileView: false))));

          },
        );
      }
    )));

    await tester.pumpAndSettle();
    await tester.tap(tapButtonFinder);
    await tester.pumpAndSettle();

    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
    expect(idFinder, findsOneWidget);


    await tester.tap(backButtonFinder);
    await tester.pumpAndSettle();

    expect(titleFinder, findsNothing);
    expect(bodyFinder, findsNothing);
    expect(idFinder, findsNothing);




  });
}
