import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Local_Pref/sharedPreferences_data.dart';
import 'Project_Routs/app_routs.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  sharedPrefdata.init();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      title: "Go router",
    );
  }
}

