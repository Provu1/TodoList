import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Models/Names/add_variables.dart';
import '../Models/auth_data.dart';

final helloWorldProvider3 = Provider((_) => 'Hello world16 ');

final counterStateProvider = StateProvider<dynamic>((ref) {
  return 0;
});

class LoginScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                Colors.white,
                Colors.white,
                Colors.indigoAccent,
                Color(0xffac255e),
                Color(0xff9288F8),
                Color(0xff9288F8),
                Color(0xff9288F8),
                Colors.indigoAccent,
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    //height: 30,
                    child: Lottie.network(addVariables.aniImage),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "Login",
                        style: GoogleFonts.akayaTelivigala(color: Colors.white,fontSize: 60),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: TextField(
                      controller: addVariables.txtEmail,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                    child: TextField(
                      controller: addVariables.txtPass,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 50,
                      width: 130,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: const Size(100, 40),
                          ),
                          onPressed: () async{
                            authdata.LoginUser(
                                email: addVariables.txtEmail.text.toString(),
                                password: addVariables.txtPass.text.toString(),
                                context: context);
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Login",style: GoogleFonts.akayaTelivigala(fontSize: 20),),
                              const Expanded(child: Icon(Icons.arrow_forward_ios,))
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent,shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(100, 40),
                          ),
                          onPressed: () async{
                            authdata.LoginUser(
                                email: addVariables.txtEmail.text.toString(),
                                password: addVariables.txtPass.text.toString(),
                                context: context);
                            context.go("/register");
                            //   if(sharedPrefdata.getString("token") != null){
                            //     sharedPrefdata.removeString("token");
                            //   }else{
                            //     log("token null");
                            //   }
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Register",style: GoogleFonts.akayaTelivigala(fontSize: 20),),
                              const Expanded(child: Icon(Icons.arrow_forward_ios,))
                            ],
                          )),
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
