import 'dart:js_interop';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/Models/Card/todo_card.dart';
import 'package:todolist/Models/todo_add.dart';


import '../Models/todo_delete.dart';
import '../provider/api_call_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    late Stream dataValue;

    Stream getItem() async*{
        await Future.delayed(const Duration(seconds: 1));
        dataValue = ref.watch(homePrfProviderUri).todoShow();

        print("state call");

      yield* dataValue;
    }
    return StreamBuilder(
      stream: getItem(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.data == null){
          return const Center(child: CircularProgressIndicator());
        }else{
          final item = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: const Text("Todo List"),backgroundColor: const Color(0xff9288F8)),
            body: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) =>
                    TodoCard(
                        description: snapshot.data?[index].description,
                        id: snapshot.data?[index].id,
                        title: snapshot.data?[index].title)
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blueAccent,autofocus: true, onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  context: context,
                  // context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        Text("Edit",
                            style: GoogleFonts.poppins(color: Colors.blue)),
                        TextField(
                          controller: txtTitleN,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                        ),
                        TextField(
                          controller: txtDescriptionN,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              todoAddNew.todoNew(
                                  title: txtTitleN.text,
                                  description: txtDescriptionN.text,
                                 );
                              Navigator.pop(context);
                            },
                            child: const Text("Create"))
                      ],
                    );
                  });

            },
              child: const Icon(CupertinoIcons.pen,size: 40),
            ),
          );
        }
      },
    );
    }
}

