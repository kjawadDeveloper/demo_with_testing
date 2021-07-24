import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';

import 'package:denis/data/api_call_response.dart';
import 'package:denis/data/posts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostsProvider {
  /// This is out Custom Stream Controller whose type is ApiCallResponse .
  /// It will handle both the Positive and negative cases
  StreamController<ApiCallResponse> _postsController = StreamController.broadcast();

  Stream<ApiCallResponse> get postsStream => _postsController.stream;

  @visibleForTesting
  Sink<ApiCallResponse> get postsSink => _postsController.sink;


  /// This method gets the Posts for the user
  Future getPosts() async {
    ApiCallResponse apiCallResponse = await _checkInternetConnection();

    if (!apiCallResponse.result) {
      _postsController.sink.add(apiCallResponse);
      return;
    }

    ApiCallResponse postsResponse = await _getPosts();

    if (!postsResponse.result) {
      _postsController.sink.add(postsResponse);
      return;
    }
    _postsController.sink.add(postsResponse);
  }

  /// This method checks if there is internet connection available or not
  Future<ApiCallResponse> _checkInternetConnection() async {
    late ApiCallResponse apiCallResponse;

    try {
      final response = await InternetAddress.lookup("www.google.com");

      if (response.isEmpty) {
        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = false;
        apiCallResponse.message = "No internet Connection";
      } else {
        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = true;
        apiCallResponse.message = "Have active internet ";
      }
    } catch (e) {
      /// On Flutter web Lookup is not supported so we treat as true
      if (e is UnimplementedError) {
        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = true;
        apiCallResponse.message = "Have active internet ";
      } else {
        print(e);

        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = false;
        apiCallResponse.message = "No Internet Connection ";
      }
    }
    return apiCallResponse;
  }

  /// This method returns the response of the posts
  Future<ApiCallResponse> _getPosts() async {
    late ApiCallResponse apiCallResponse;

    try {
      final Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode != 200) {
        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = false;
        apiCallResponse.message = "Something went wrong";
      } else {
        apiCallResponse = ApiCallResponse.initial();
        apiCallResponse.result = true;
        apiCallResponse.message = "Data Fetched";

        apiCallResponse.data = (jsonDecode(response.body) as List).map((e) => Posts.fromJson(e)).toList(growable: false);
      }
    } catch (e) {
      print(e);

      apiCallResponse = ApiCallResponse.initial();
      apiCallResponse.result = false;
      apiCallResponse.message = "No Internet Connection ";
    }
    return apiCallResponse;
  }



  @visibleForTesting
  Future<ApiCallResponse> get getPostsInternal => _getPosts();



  void dispose() {
    _postsController.close();
  }
}
