import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class EmailAuthService {
  static Future<Map<String, Object>> registerUser(
      String email, String password, String fullName) async {
    Map<String, Object> result = new Map();
    try {
      String requestURL = "http://159.65.154.185:89/api/signup";
      Map requestData = {
        "name": fullName,
        "email": email,
        "password": password
      };
      var body = convert.jsonEncode(requestData);
      var response = await http.post(requestURL,
          headers: {"Content-Type": "application/json"}, body: body);
      Map<String, dynamic> responseMap = convert.jsonDecode(response.body);
      print('Response: ' + responseMap.toString());
      if (responseMap["error"] == true) {
        throw Exception(responseMap["cause"].toString());
      }
      result['user_id'] = responseMap["user_id"];
    } catch (e) {
      result['error'] =
          'Error occured while registering your account: ' + e.toString();
      return result;
    }
  }

  static Future<Map<String, Object>> signInWithEmailAndPassword(
      String email, String password) async {
    Map<String, Object> result = new Map();
    try {
      String requestURL = "http://159.65.154.185:89/api/login";
      Map requestData = {
        "email": email,
        "password": password
      };
      var body = convert.jsonEncode(requestData);
      var response = await http.post(requestURL,
          headers: {"Content-Type": "application/json"}, body: body);
      Map<String, dynamic> responseMap = convert.jsonDecode(response.body);
      print('Response: ' + responseMap.toString());
      if (responseMap["error"] == true) {
        throw Exception(responseMap["cause"].toString());
      }
      result['user_id'] = responseMap["user_id"];
      return result;
    } catch (e) {
      result['error'] =
          'Error occured while logging in: ' + e.toString();
      return result;
    }
  }

//  Future<Map<String, Object>> sendResetPasswordLink(String email) async {
//    Map<String, Object> result = new Map();
//    try {
//      print(email);
//      await _auth.sendPasswordResetEmail(email: email);
//      print('Forgot Password Email Sent Successfully!');
//      result['sent'] = 'yes';
//      return result;
//    } on PlatformException catch (error) {
//      switch (error.code) {
//        case 'ERROR_INVALID_EMAIL':
//          {
//            print('ERROR_INVALID_EMAIL');
//            result['error'] = 'Please use a valid email';
//            return result;
//          }
//          break;
//        case 'ERROR_USER_NOT_FOUND':
//          {
//            print('ERROR_USER_NOT_FOUND');
//            result['error'] = 'No user found with this email';
//            return result;
//          }
//          break;
//        default:
//          {
//            result['error'] =
//                'Error occured while sending email: ' + error.message;
//            return result;
//          }
//          break;
//      }
//    } catch (e) {
//      result['error'] = 'Error occured while sending email: ' + e.toString();
//      return result;
//    }
//  }
}
