import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Screen/home_screen.dart';

import '../Models/auth_data.dart';

// globle get method data 👇👇👇👇👇
final helloWorldProvider3 = Provider((_) => 'Hello world16 ');

// globle set method 👇👇👇👇👇
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class RegisterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider3);
    // final int value2 = ref.watch(counterStateProvider);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Register",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            ),
            TextField(
              controller: txtName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: txtDob,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Dob',
              ),
            ),
            TextField(
              controller: txtGender,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gender',
              ),
            ),
            TextField(
              controller: txtPass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () async {
                      //context.go("/home");
                      authdata.createUser(
                          name: txtName.text.toString(),
                          email: txtEmail.text.toString(),
                          dob: txtDob.text.toString(),
                          password: txtPass.text.toString(),
                          gender: txtGender.text.toString(),
                          context: context);
                    },
                    child: const Text("Register"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent),
                    onPressed: () {
                      context.go("/login");
                    },
                    child: const Text("Login"))),
          ],
        ),
      ),
    );
  }
}
