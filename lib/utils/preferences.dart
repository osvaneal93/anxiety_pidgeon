
import 'package:pidge_on/src/pages/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Preferences {
  static final Preferences _instance = Preferences._();

  factory Preferences(){
    return _instance;
  }
  Preferences._();
  SharedPreferences _prefs;

  Future <void> initialize()async {
    _prefs = await SharedPreferences.getInstance();
  }
  get initialPage{
    return _prefs.getString('initialPage') ?? OnBoarding.routeName;
  }
  set initialPage(String value){
    _prefs.setString('initialPage', value);
  }
}