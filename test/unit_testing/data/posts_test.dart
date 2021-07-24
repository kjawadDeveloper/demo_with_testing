import 'package:denis/data/api_call_response.dart';
import 'package:denis/data/posts.dart';
import 'package:test/test.dart';

main(){


  test("Should give posts from default constructor", (){

    Posts posts = Posts(userId: 1, id: 2, title: "Jawad", body: "Ahmed");
    expect(posts.userId, 1);
    expect(posts.id, 2);
    expect(posts.title, "Jawad");
    expect(posts.body, "Ahmed");

  });



  test("Should give posts from Json Constructor", (){
    Posts posts = Posts.fromJson({
      "userId": 1,
      "id": 2,
      "title": "Jawad",
      "body": "Ahmed"
    });

    expect(posts.userId, 1);
    expect(posts.id, 2);
    expect(posts.title, "Jawad");
    expect(posts.body, "Ahmed");

  });


  test("Should give json representation", (){
    Posts posts = Posts.fromJson({
      "userId": 1,
      "id": 2,
      "title": "Jawad",
      "body": "Ahmed"
    });

    Map<String, dynamic> map = posts.toJson();

    expect(map["userId"], 1);
    expect(map["id"], 2);
    expect(map["title"], "Jawad");
    expect(map["body"], "Ahmed");

  });



}