
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/Names/add_variables.dart';
import '../Models/auth_data.dart';


class RegisterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
              controller: addVariables.txtName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: addVariables.txtEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: addVariables.txtDob,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Dob',
              ),
            ),
            TextField(
              controller: addVariables.txtGender,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gender',
              ),
            ),
            TextField(
              controller: addVariables.txtPass,
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
                          name: addVariables.txtName.text.toString(),
                          email: addVariables.txtEmail.text.toString(),
                          dob: addVariables.txtDob.text.toString(),
                          password: addVariables.txtPass.text.toString(),
                          gender:addVariables.txtGender.text.toString(),
                          context: context);
                    },
                    child: const Text("Register"))),
          ],
        ),
      ),
    );
  }
}
