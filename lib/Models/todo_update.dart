

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Names/add_variables.dart';
import 'Local_Pref/sharedPreferences_data.dart';

TextEditingController txtTitleU = TextEditingController();
TextEditingController txtDescriptionU = TextEditingController();
final todoUpdateNew =  todoUpdate._();
class todoUpdate{
  todoUpdate._();
  Future<dynamic> todoUpdateSet({required String? title,required String? description,required String? id}) async {
    HttpLink link = HttpLink(addVariables.URL, defaultHeaders: {
      'Authorization':"${sharedPrefdata.getString('token')}", // Example: Adding an Authorization header
    },);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    QueryResult result = await qlClient.mutate(
      MutationOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(
              ''' mutation Mutation(\$id: ID!, \$description: String, \$isDone: Boolean, \$title: String) {
  editTodo(_id: \$id , description: \$description ,isDone: \$isDone,title: \$title) {
  description
  title
  isDone
  id
  
    }
      }'''
          ),
          variables:  {
            "id": id,
            "description": description,
            "title": title,
          }
      ),

    );

    if (result.hasException) {
      log("Result fall");
    } else {
      log("$result");

    }
  }


}