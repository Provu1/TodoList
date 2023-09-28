

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Names/add_variables.dart';

import 'Local_Pref/sharedPreferences_data.dart';

TextEditingController txtTitleN = TextEditingController();
TextEditingController txtDescriptionN = TextEditingController();
final todoDeleteNew =  todoDelete._();
class todoDelete{
  todoDelete._();
  Future<dynamic> todoDeleteSet({required String? id}) async {
    HttpLink link = HttpLink(addVariables.URL, defaultHeaders: {
      'Authorization':"${sharedPrefdata.getString('token')}", // Example: Adding an Authorization header
    },); // it's my url
    GraphQLClient qlClient = GraphQLClient( // craete a graphql client
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    QueryResult result = await qlClient.mutate( // use mutate method for mutation
      MutationOptions( // we use mutation options
          fetchPolicy: FetchPolicy.networkOnly,// you can use different policy as per your need
          document: gql(
              ''' mutation Mutation(\$todoId: ID!) {
  deleteTodo(todoId: \$todoId)
    }'''
          ),
          variables:  {
            "todoId": id,
          }
      ),
    );
    if (result.hasException) {
      log("fall");
    } else {
      log("$result");

    }
  }
}