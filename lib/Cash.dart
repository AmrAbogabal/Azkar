import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
  static SharedPreferences? sharedPrefrences ;
  static init()async{
    sharedPrefrences = await SharedPreferences.getInstance() ;
  }
  static void putS({required String key , required List<String> Li}){
    sharedPrefrences?.setStringList(key,Li);
  }
  static dynamic getS({required String key}){
    return sharedPrefrences?.getStringList(key);
  }
}
