import 'package:denis/data/posts.dart';
import 'package:denis/pages/post_detail.dart';
import 'package:denis/pages/posts_list/error_widget.dart' as EV;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


main() {
  testWidgets("Should show error widget", (tester) async {

    Finder errorFinder = find.text("Something went wrong");
    Finder errorIconFinder = find.byIcon(Icons.error);


    await tester.pumpWidget(MaterialApp(home: Material(child: EV.ErrorWidget(message: "Something went wrong",))));

    await tester.pumpAndSettle();

    expect(errorIconFinder, findsOneWidget);
    expect(errorFinder, findsOneWidget);
  });





}
