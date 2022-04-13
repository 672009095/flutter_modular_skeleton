
/*
there is class for request JSON parameters
* */
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class Request {

  Future<http.Response> get({String? url,Map<String, String>? headers})async {
    var uriResponse = await http.get(Uri.parse(url as String),headers: headers);
    return uriResponse;
  }
  Future<http.Response> post(Object body,{String? url,Map<String, String>? headers})async{
    var uriResponse = await http.post(
        Uri.parse(url as String),
        headers: headers,
        body: body);
    return uriResponse;
  }
}