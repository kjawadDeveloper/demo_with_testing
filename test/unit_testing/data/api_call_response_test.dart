import 'package:denis/data/api_call_response.dart';
import 'package:test/test.dart';

main(){


  test("APi Call Default constructor", (){

    ApiCallResponse apiCallResponse = ApiCallResponse(data: [], result: true, message: "Hello Dear", code: 200);
    expect(apiCallResponse.result, true);
    expect(apiCallResponse.message, "Hello Dear");

  });



  test("APi inital", (){

    ApiCallResponse apiCallResponse = ApiCallResponse.initial();
    expect(apiCallResponse.result, true);
    expect(apiCallResponse.message, "");

  });



  test("APi testing", (){

    ApiCallResponse apiCallResponse = ApiCallResponse.initial();
    expect(apiCallResponse.result, true);
    expect(apiCallResponse.message, "");

  });


  test("should parse json", (){

    ApiCallResponse apiCallResponse = ApiCallResponse.fromJson({
    "result" :  true,
    "data" : "Jawad",
    "message" :  "Date Get",
    "code" :  200
    });
    expect(apiCallResponse.result, true);
    expect(apiCallResponse.message, "Date Get");

  });


  test("should return api call testing", (){

    ApiCallResponse apiCallResponse = ApiCallResponse.testing();
    expect(apiCallResponse.result, true);
    expect(apiCallResponse.code, 200);

  });
}