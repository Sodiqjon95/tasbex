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
          Align(
              child: Image.asset(
            "assets/images/tasbex_png-removebg-preview.png",
            width: 400.w,
          )),
          Positioned(
            left: 90.w,
            right: 90.w,
            top: 260.h,
            child: Text(
              count.toString(),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 60.sp),
            ),
          ),
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 365.h,
            child: Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    StorageService.instance.storage.write("count", count >= 999999 ? count = 0 : count++);
                    setState(() {});
                  },
                )),
          ),
          Positioned(
            left: 165.w,
            right: 10.w,
            top: 390.w,
            child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    StorageService.instance.storage.write("count", count = 0);
                    setState(() {});
                  },
                )),
          ),
        ],
      ),
    );
  }
}
