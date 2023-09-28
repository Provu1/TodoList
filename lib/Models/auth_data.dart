import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Names/add_variables.dart';

import 'Local_Pref/sharedPreferences_data.dart';

final authdata = auth._();

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
      HttpLink link = HttpLink(addVariables.URL);
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
                '''mutation(\$name: String!, \$email: String!, \$dob: Date!, \$gender: String!, \$password: String!){
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
        log(" Error Exception ");
      } else {
        log("Successfully Register");
        context.go("/home");
      }
    } catch (e) {
      log("Register Method does not work");
    }
  }
// Login -- Method
  Future<dynamic> LoginUser(
      {required String? email,
      required String? password,
      required BuildContext context}) async {
    try {
      HttpLink link = HttpLink(addVariables.URL); // it's my url
      GraphQLClient qlClient = GraphQLClient(
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

      log("$queryResult");
      log("Bearer "+ queryResult.data!["loginUser"]["token"]);
      if (queryResult.hasException) {
        log(" Login Error Exception ");
      } else {
        log("Login Successfully ");
        context.go("/home");

      }
    } catch (e) {
      log("Login Method does not work");
    }
  }
}
