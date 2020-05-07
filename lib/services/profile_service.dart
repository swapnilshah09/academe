import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:academe/constant.dart';

class ProfileService {
  static Future<Map<String, Object>> updateUserProfile(
      String name, String email) async {
    String authToken;
    Map<String, Object> result = new Map();
    try {
      var uri = Uri.https(kAPIDomain, '/api/login');
      Map requestData = {"name": name, "email": email, "token": authToken};
      var body = convert.jsonEncode(requestData);
      var response = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: body);
      Map<String, dynamic> responseMap = convert.jsonDecode(response.body);
      print('Response: ' + responseMap.toString());
      if (responseMap["error"] == true) {
        throw Exception(responseMap["cause"].toString());
      }
      result['data'] = responseMap["data"];
      return result;
    } catch (e) {
      result['error'] = 'Error occured while logging in: ' + e.toString();
      return result;
    }
  }
}
