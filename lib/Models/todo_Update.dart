

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'SharedPreferences_data.dart';
TextEditingController txtTitleU = TextEditingController();
TextEditingController txtDescriptionU = TextEditingController();
//TextEditingController txtId = TextEditingController();
final todoUpdateNew =  todoUpdate._();
class todoUpdate{
  todoUpdate._();
  Future<dynamic> todoUpdateSet({required String? title,required String? description,required String? id}) async {
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
      print("fall");
    } else {
      print("$result");

    }
  }


}