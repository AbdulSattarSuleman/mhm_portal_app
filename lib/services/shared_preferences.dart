import 'package:shared_preferences/shared_preferences.dart';

String _username = '';

class SharedPreferncesServices {
  // static void set(String key, String value) async{
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }

  static void setData<T>(String key, T value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  }

  static String getData(String key) {
    SharedPreferences.getInstance().then((prefs) {
      _username = prefs.getString(key) ?? 'MHM';
    });
    return _username;
  }

  // static T getData<T>(String key) {
  //   SharedPreferences.getInstance().then((prefs) {
  //     if (T is String) {
  //       return prefs.getString(key) as T;
  //     } else if (T is bool) {
  //       return prefs.getBool(key) as T;
  //     }
  //   });
  //   return null as T;
  // }

  // static Future<String> getData(String key) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   //if (T is String) {
  //   return prefs.getString(key) as String;
  //   //} else if (T is bool) {
  //   //return prefs.getBool(key) as T;
  //   //}
  //   // return T.toString();
  // }
}
