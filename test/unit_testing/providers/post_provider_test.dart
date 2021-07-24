import 'package:denis/data/api_call_response.dart';
import 'package:denis/providers/posts_provider.dart';
import 'package:flutter_test/flutter_test.dart';


main(){
  test("should call get posts method", (){

    PostsProvider postsProvider = PostsProvider();
    postsProvider.getPosts();
  });


  test("should call get Post method", () async {

    PostsProvider postsProvider = PostsProvider();
    Future<ApiCallResponse> getPost = postsProvider.getPostsInternal;
    print(await getPost);
  });



  test("should dispose controller", () async {

    PostsProvider postsProvider = PostsProvider();
    postsProvider.dispose();

  });


}