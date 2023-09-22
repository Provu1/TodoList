import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/auth_data.dart';

final helloWorldProvider3 = Provider((_) => 'Hello world16 ');

final counterStateProvider = StateProvider<dynamic>((ref) {
  return 0;
});

class LoginScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider3);
    // final int value2 = ref.watch(counterStateProvider);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff152f49),
                Colors.indigoAccent,
                Color(0xffac255e),
                Color(0xff070404),
                Color(0xff152f49),
                Color(0xff070404),
                Color(0xff41c29e),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Lottie.network(
                      'https://lottie.host/e29b464a-9782-4e20-a1a3-a9f4782a06ea/Rjad13iM6U.json'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: txtEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextField(
                    controller: txtPass,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 60,
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(100, 40), //////// HERE
                        ),
                        onPressed: () async{

                          authdata.LoginUser(
                              email: txtEmail.text.toString(),
                              password: txtPass.text.toString(),
                              context: context);

                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Login",style: TextStyle(fontSize: 20),),
                            Expanded(child: Icon(Icons.arrow_forward_ios,))
                          ],
                        )),
                  ),
                ),

                //SizedBox(width: 300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),onPressed:(){ }, child: const Text("Login") )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
