import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key, required this.myListener}) : super(key: key);

  final ValueChanged<String> myListener;

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(child: Image.asset("assets/images/tasbex_png.png")),
            const Positioned(
              left: 0,
              right: 0,
              // bottom: 0,
              top: 285,
              child: Text(
                "0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 60),
              ),
            )
          ],
        ),
      ),
    );
  }
}
