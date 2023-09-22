import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/Models/todoDelete.dart';
import 'package:todolist/Models/todo_Update.dart';
import 'package:todolist/Models/todo_add.dart';
import 'package:todolist/Models/todo_call.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String id;

  TodoCard({required this.description, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(color: Colors.blue),
              ),
              Text(description),
            ],
          ),
          GestureDetector(
              onTap: () {
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
                                todoUpdateNew.todoUpdateSet(
                                    title: txtTitleN.text,
                                    description: txtDescriptionN.text,
                                    id: id);
                              },
                              child: const Text("Update"))
                        ],
                      );
                    });
              },
              child: Icon(Icons.edit)),
          GestureDetector(
              onTap: () async {
                await todoDeleteNew.todoDeleteSet(id: id);
                await Showtodo.todoShow();
              },
              child: Icon(Icons.delete_forever))
        ],
      )),
    );
  }
}
