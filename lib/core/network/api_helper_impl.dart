import 'dart:convert';
import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:cubit_architecture/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: ApiHelper)
class ApiHelperImpl implements ApiHelper {

  final http.Client client = http.Client();

  @override
  Future get(String endPoint) async {
    final response =
    await client.get(Uri.https(kTmdbBaseUrl, endPoint, _authParams()));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error communicating with server. Code: ${response.statusCode}');
    }
  }

  Map<String, String> _authParams() {
    return {"api_key": kTmdbApiKey};
  }
}