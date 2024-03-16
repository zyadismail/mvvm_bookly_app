import 'package:dio/dio.dart';

class ApiServer {
  final _basUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiServer(this._dio);

  Future<Map<String, dynamic>> getBooks({required String endPoint,required String q}) async {
    var response = await _dio.get(
      '$_basUrl$endPoint',
      queryParameters: {
        "q" : q
      }
    );

    return response.data;
  }
}
