
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'SharedPreferences_data.dart';

TextEditingController txtTitle = TextEditingController();
TextEditingController txtDescription = TextEditingController();

final todoAddNew = todoAdd._();

class todoAdd{
  todoAdd._();
  Future<dynamic> todoNew({required String? title,required String? description}) async {
    HttpLink link = HttpLink("http://localhost:5000/graphql", defaultHeaders: {
      'Authorization':"${sharedPrefdata.getString('token')}", // Example: Adding an Authorization header
    },); // it's my url
    GraphQLClient qlClient = GraphQLClient( // craete a graphql client
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ); // ignore , just for cacheing
    QueryResult result = await qlClient.mutate( // use mutate method for mutation
      MutationOptions( // we use mutation options
        fetchPolicy: FetchPolicy.networkOnly,// you can use different policy as per your need
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