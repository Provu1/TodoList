
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Names/add_variables.dart';

import 'Local_Pref/sharedPreferences_data.dart';

TextEditingController txtTitle = TextEditingController();
TextEditingController txtDescription = TextEditingController();

final todoAddNew = todoAdd._();

class todoAdd{
  todoAdd._();

  Future<dynamic> todoNew({required String? title,required String? description}) async {
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
            ''' mutation CreateTodo(\$title: String!, \$description: String!) {
  createTodo(title: \$title, description: \$description) {
  title
  description
  id  
  }
  }'''
        ),
          variables:  {
            "title": title,
            "description": description }
      ),

    );

    if (result.hasException) {
      print("fall");
    } else {
      print("$result");

    }
  }


}