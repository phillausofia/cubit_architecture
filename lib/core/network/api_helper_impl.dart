import 'dart:convert';

import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiHelperImpl implements ApiHelper {

  final String baseUrl;
  final String apiKey;
  final http.Client client;

  ApiHelperImpl({
    required this.baseUrl,
    required this.apiKey,
    required this.client,
});

  @override
  Future get(String endPoint) async {
    final response =
    await client.get(Uri.https(baseUrl, endPoint, _authParams()));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error communicating with server. Code: ${response.statusCode}');
    }
  }

  Map<String, String> _authParams() {
    return {"api_key": apiKey};
  }
}