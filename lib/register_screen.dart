import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/homescreen.dart';
import 'package:todolist/provider/data_provider.dart';

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
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            const Text("Register",style: TextStyle(fontSize: 60,color: Colors.white),),
             TextField(
                controller: txtName1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
             TextField(
               controller: txtEmail,
               decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
             TextField(
              controller: txtDob,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Dob',
              ),
            ),
             TextField(
              controller: txtGender,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gender',
              ),
            ),
             TextField(
              controller: txtPass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),

            SizedBox(width: 300,child: ElevatedButton(onPressed:(){
              //LoginUser(email: "srk",password: "srksrk");

             //  createUser(name: txtName1.text.toString(),email: txtEmail.text.toString(),dob: txtDob.text.toString(), password: txtPass.text.toString(), gender: txtGender.text.toString());
              print(txtEmail.text.toString());


              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  HomeScreen(),
                ),
              );

            }, child: const Text("Register") )),
            SizedBox(width: 300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),onPressed:(){ }, child: const Text("Login") )),
          ],
        ),
      ),
    );
  }
  Future<dynamic> LoginUser({String? email,String? password}) async {
    HttpLink link = HttpLink("http://localhost:5000/graphql"); // it's my url
    GraphQLClient qlClient = GraphQLClient( // craete a graphql client
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ); // ignore , just for cacheing
    QueryResult queryResult = await qlClient.mutate( // use mutate method for mutation
      MutationOptions( // we use mutation options
          fetchPolicy: FetchPolicy.networkOnly,// you can use different policy as per your need
          document: gql(
              ''' mutation(\$email: String!, \$password: String!){
              loginUser(email: \$email, password: \$password) {
            token
         user {
         age
            
            }
  }
 }'''
            // as tou graphql need query string
          ),
          variables: {
            "email":email,
            "password":password
          }),
    );
    print("code221");
    print(queryResult);
    // return queryResult.data?['createUser'] ?? false; // queryResult.data contains response data here after creation my api return true
    //  and if it's null then i am return false
  }

  //sing up

  // create user



}