

import 'package:flutter/material.dart';

import 'data_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DataScreen(myListener: (value){
                print("value: $value");
              });
            }));
          }, child: Text("press"),
        ),),
    );
  }
}
