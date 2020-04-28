import 'shared_pref_service.dart';

class AuthenticationService {
  static Future<bool> isAuthenticated() async {
    Map _authTokenResultMap = new Map();
    try {
      _authTokenResultMap =
          await SharedPrefService.fetchFromSharedPref('authToken');
      if (_authTokenResultMap.containsKey('error')) {
        throw Exception(_authTokenResultMap['error']);
      }
      print(_authTokenResultMap.toString());
      if (_authTokenResultMap.containsKey('authToken') &&
          _authTokenResultMap['authToken'] != null &&
          _authTokenResultMap['authToken'].toString().isNotEmpty) {
        print('Authenticated');
        return true;
      }
    } catch (e) {
      print('Error occured while checking token: ' + e.toString());
      return false;
    }
    return false;
  }
}
