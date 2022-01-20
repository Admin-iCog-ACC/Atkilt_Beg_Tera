import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retailer_app/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:retailer_app/services/auth_service.dart';

Future<Response> get<T>(APIService resource) async {
  Map<String, String> headers = await AuthService().getHeader();
  print('token in web API: $headers');
  return http.get(resource.url!, headers: headers).then((value) => value);
}

Future<Response> post<T>(APIService resource) async {
  Map<String, String> headers = await AuthService().getHeader();
  final response =
      await http.post(resource.url!, body: resource.body, headers: headers);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception(response.statusCode);
  }
}

Future<Response> put<T>(APIService resource) async {
  Map<String, String> headers = await AuthService().getHeader();
  final response =
      await http.put(resource.url!, body: resource.body, headers: headers);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception(response.statusCode);
  }
}

Future<Response> delete<T>(APIService resource) async {
  Map<String, String> headers = await AuthService().getHeader();
  final response = await http.delete(resource.url!, headers: headers);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception(response.statusCode);
  }
}

Future<Response> putFormData<T>(APIService resource) async {
  Map<String, String> headers = await AuthService().getHeader();
  var request = new http.MultipartRequest("PUT", resource.url!);

  resource.body.forEach((key, value) {
    request.fields[key] = value.toString();
  });

  resource.files?.forEach((element) async {
    final file = await http.MultipartFile.fromPath('fileupload', element.path,
        contentType: new MediaType('image', 'jpeg'));
    request.files.add(file);
  });
  final data = await request.send();
  final response = await http.Response.fromStream(data);
  if (response.statusCode == 200) {
    return resource.parse!(response);
  } else {
    throw Exception(response.statusCode);
  }
}
