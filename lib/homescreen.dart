
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// globle get method data 👇👇👇👇👇
final helloWorldProvider3 = Provider((_) => 'Hello world16 ');

// globle set method 👇👇👇👇👇
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider3);
    // final int value2 = ref.watch(counterStateProvider);

    return
       Scaffold(
        backgroundColor: Colors.green,
        body: Text("app set")

    );
  }
}