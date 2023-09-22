import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeProvider extends ChangeNotifier {

  Future<dynamic> signOut() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);
    notifyListeners();
  }
}
final homePrfProvider = ChangeNotifierProvider<homeProvider>((ref) {
  return homeProvider();
});