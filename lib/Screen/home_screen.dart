import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/Models/todo_call.dart';
import 'package:todolist/Models/todo_Card.dart';

import '../Models/SharedPreferences_data.dart';
import '../Models/auth_data.dart';
import '../Models/todo_add.dart';
// final helloWorldProvider3 = Provider((_) => 'Hello world16 ');
//
// final counterStateProvider = StateProvider<dynamic>((ref) {
//   return 0;
// });

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    {
     final dataValue = ref.watch(fetchToDosProvider);

      return dataValue.when(
        data: (data) {
          print('data: $data');
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title:  const Text('TODO List'),
            ),
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => TodoCard(
                  description: data[index].description,
                  id: data[index].id,
                  title: data[index].title),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                var a = sharedPrefdata.getString('token');
                print(a);
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ), context: context,
                    // context: context,
                    builder: (context) {
                      return  Column(
                        children: [
                          Text("Add New",style: GoogleFonts.poppins(color: Colors.blue)),
                          TextField(
                            controller: txtTitle,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Title',
                            ),
                          ),
                          TextField(
                            controller: txtDescription,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                            ),
                          ),
                          ElevatedButton(onPressed:(){
                            todoAddNew.
                            todoNew(title: txtTitle.text, description: txtDescription.text );
                          }, child: const Text("Update"))
                        ],
                      );
                    }
                );
              },
              tooltip: 'Increment',
              child: const Icon(Icons.edit),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Text('Error'),
          ),
        ),
      );
    }
}}
