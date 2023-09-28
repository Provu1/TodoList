import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/Names/add_variables.dart';

import '../Models/Card/todo_model.dart';


class ApiCallProvider extends ChangeNotifier {


  Stream<List> todoShow() async* {
    print("api run");
    HttpLink link = HttpLink(addVariables.URL, defaultHeaders: {
      'Authorization':"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MGE5NmU0OThhZjRlNzMzNzUxYjVhMCIsIm5hbWUiOiJBcmthIFNoZWlraCIsImVtYWlsIjoiYXJrYS5zQGRpZ2l0YWxlZGdlMzYwLmluIiwiaWF0IjoxNjk1ODg1NTM4fQ.m5BNgX7rOZoPAJV33eJkpZVCY_X9IXOTnO57uzqzsNc", // Example: Adding an Authorization header
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
            ''' query GetTodosByUser {
  getTodosByUser {
  title  
  id
  isDone
  description
  }
}'''
        ),

      ),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    }

    List res = result.data?["getTodosByUser"];

    if (res.isEmpty) {
      yield [];

    } else {

      List<Todo> todos = res
          .map<Todo>((item) => Todo(
          description: item["description"],
          id: item["id"],
          title: item["title"]))
          .toList();
       notifyListeners();

      log("todos call api");
      yield todos;
    }
  }
}

final homePrfProviderUri = ChangeNotifierProvider<ApiCallProvider>((ref) {
  return ApiCallProvider();
});