import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
//final helloWorldProvider = Provider((_) => 'Hello world6 ');

final counterProvider = StateProvider<int>((ref) => 0);
final helloWorldProvider = Provider<String>((_) => 'Hello world');

TextEditingController txtEmail = TextEditingController();
TextEditingController txtName1 = TextEditingController();
TextEditingController txtDob =  TextEditingController();
TextEditingController txtGender = TextEditingController();
TextEditingController txtPass = TextEditingController();
//sing up
Future<dynamic> createUser({required String? name, required String? email,required String? dob ,required String? gender,required String? password}) async {
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
          }'''
        ),
        variables: {
          "name": name,
          "email":email,
          "dob":dob,
          "gender": gender,
          "password":password
        }),
  );

  print(queryResult);


}

