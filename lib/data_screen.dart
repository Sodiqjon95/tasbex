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
          Center(
            child: Image.asset(
              "assets/images/tasbeeh.png",
              width: 400.w,
              height: 350.h,
            ),
          ),
          Center(
            child: SizedBox(
              width: 200.w,
              height: 280.h,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            count.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 55.sp),
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  StorageService.instance.storage.write("count", count = 0);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.restart_alt),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child:
                    Padding(
                      padding: const EdgeInsets.only(right: 50,left: 50),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r))),
                              minimumSize: MaterialStatePropertyAll(Size(50.w, 50.h)),
                              maximumSize: MaterialStatePropertyAll(Size(100.w, 100.h))),
                          onPressed: () {
                            StorageService.instance.storage.write("count", count >= 100000 ? count = 0 : count++);
                            setState(() {});
                          },
                          child: Container(color: Colors.transparent),
                        ),
                      ),
                    ),

                  ),
                SizedBox(height: 10.h,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
