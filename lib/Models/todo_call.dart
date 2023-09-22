import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todolist/Models/todo_model.dart';

import 'SharedPreferences_data.dart';


final Showtodo = todo._();
class todo{
  todo._();
  Future<List> todoShow() async {
    print("api run");
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
   // print("code221");
    //
    //   print(queryResult);
    if (result.hasException) {
      throw Exception(result.exception);
    }

    List res = result.data?["getTodosByUser"];

    if (res == null || res.isEmpty) {
      return [];
    } else {
      List<Todo> todos = res
          .map<Todo>((item) => Todo(
          description: item["description"],
          id: item["id"],
          title: item["title"]))
          .toList();

      print(todos);
      return todos;
    }
  }
}
final homeRepositoryProvider = Provider<todo>((ref) {
  return Showtodo;
});
final fetchToDosProvider = FutureProvider<List>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.todoShow();

});

