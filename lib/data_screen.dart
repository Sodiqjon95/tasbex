import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasbex/storage_service.dart';

// ignore: must_be_immutable
class DataScreen extends StatefulWidget {
  DataScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0.w,
              right: 0.w,
              bottom: 210.h,
              // top: 0,
              child: Image.asset(
            "assets/images/tasbex_png-removebg-preview.png",
            height: 400.h,
          )),
          Positioned(
              top: 220.h,
              right: 80.w,
              child: Container(
                width: 200.w,
                height: 300.h,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black
                        )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 20.h,),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: Text(
                                  count.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 60.sp),
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r))),
                                      minimumSize: MaterialStatePropertyAll(Size(20.w, 20.w)),
                                      maximumSize: MaterialStatePropertyAll(Size(40.w, 40.w))),
                                  onPressed: () {
                                    StorageService.instance.storage.write("count", count = 0);
                                    setState(() {});
                                  },
                                  child: Container(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          child: Column(
                            children: [
                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r))),
                                      minimumSize: MaterialStatePropertyAll(Size(50.w, 50.w)),
                                      maximumSize: MaterialStatePropertyAll(Size(90.w, 90.w))),
                                  onPressed: () {
                                    StorageService.instance.storage.write("count", count >= 999999 ? count = 0 : count++);
                                    setState(() {});
                                  },
                                  child: Container(color: Colors.transparent),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

// ++ button
// ,
// ===============================================================
// count = 0 button

// =====================================
