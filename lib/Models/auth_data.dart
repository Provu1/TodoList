import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPreferences_data.dart';

final authdata = auth._();
//Text
TextEditingController txtEmail = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtDob =  TextEditingController();
TextEditingController txtGender = TextEditingController();
TextEditingController txtPass = TextEditingController();

class auth {
  auth._();

  //create user
  Future<dynamic> createUser(
      {required String? name,
      required String? email,
      required String? dob,
      required String? gender,
      required String? password,
      required BuildContext context}) async {
    try {
      HttpLink link = HttpLink("http://localhost:5000/graphql");
      GraphQLClient qlClient = GraphQLClient(
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      );
      QueryResult queryResult = await qlClient.mutate(
        MutationOptions(
            fetchPolicy: FetchPolicy.networkOnly,
            document: gql(
                ''' mutation(\$name: String!, \$email: String!, \$dob: Date!, \$gender: String!, \$password: String!){
          registerUser(name: \$name, email: \$email, dob: \$dob, gender: \$gender, password: \$password) {
          token
          user {
          avatar
          age
          name
          }}
          }'''),
            variables: {
              "name": name,
              "email": email,
              "dob": dob,
              "gender": gender,
              "password": password
            }
            ),
      );

      print(queryResult);

      if (queryResult.hasException) {
        print(" Error Exception ");
      } else {
        print("Successfully work");
        context.go("/home");
      }
    } catch (e) {
      print("Register Method does not work");
    }
  }

// Login -- Method
  Future<dynamic> LoginUser(
      {required String? email,
      required String? password,
      required BuildContext context}) async {
    try {
      HttpLink link = HttpLink("http://localhost:5000/graphql"); // it's my url
      GraphQLClient qlClient = GraphQLClient(
        // craete a graphql client
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      );
      QueryResult queryResult = await qlClient.mutate(
        MutationOptions(
            fetchPolicy: FetchPolicy.networkOnly,
            document: gql(''' mutation(\$email: String!, \$password: String!){
              loginUser(email: \$email, password: \$password) {
            token
         user {
         age
            
            }
  }
 }'''),
            variables: {"email": email, "password": password}),
      );
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', "Bearer " + queryResult.data!["loginUser"]["token"]);
      sharedPrefdata.setString("token","Bearer "+queryResult.data!["loginUser"]["token"]);

      print(queryResult);
      print("Bearer " + queryResult.data!["loginUser"]["token"]);
      if (queryResult.hasException) {
        print(" Login Error Exception ");
      } else {
        print("Login Successfully ");
        context.go("/home");
      }
    } catch (e) {
      print("Login Method does not work");
    }
  }
}
