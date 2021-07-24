class ApiCallResponse<T>{
  late T data;
  late bool result;
  late String message;
  late int code;
  ApiCallResponse({required this.data, required this.result, required this.message, required this.code});


  ApiCallResponse.initial(){
    data = [] as T;
    result  = true;
    message = "";
    code = 200;
  }

  ApiCallResponse.testing(){
    data = [] as T;
    result  = true;
    message = "";
    code = 200;
  }

  ApiCallResponse.fromJson(Map<String, dynamic> json){
    result = json["result"];
    data = json["data"];
    message = json["message"];
    code = json["code"];
  }

  @override
  String toString() {
    return 'ApiCallResponse{data: $data, result: $result, message: $message, code: $code}';
  }
}