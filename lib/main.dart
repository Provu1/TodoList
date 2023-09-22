import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/SharedPreferences_data.dart';
import 'package:todolist/Screen/home_screen.dart';
import 'package:todolist/Screen/register_screen.dart';
import 'Project_Routs/app_routs.dart';
// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
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

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
