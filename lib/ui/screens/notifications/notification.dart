import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = '/notification';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
        /* body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(title: 'Notification'),
              customTitle('Today'),
              SizedBox(
                height: 150.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return NotificationItem();
                  },
                ),
              ),
              addH(10.h),
              customTitle('Yesterday'),
              SizedBox(
                height: 450.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return  NotificationItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  Widget customTitle(String txt) {
    return Text(
      txt,
      style: TextStyle(color: Colors.red, fontSize: 12.sp),
    );
  }
}
