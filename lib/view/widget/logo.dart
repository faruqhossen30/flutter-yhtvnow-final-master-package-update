import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yhtvnow/const/color.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 360.w,
      decoration: BoxDecoration(color: Color(0xff052240)),
      child: Center(
        // child: Wrap(
        //   direction: Axis.horizontal,
        //   alignment: WrapAlignment.center,
        //   crossAxisAlignment: WrapCrossAlignment.center,
        //   spacing: 5,
        //   children: [
        //     Text('YHTV', style: TextStyle(color: yellowColor, fontSize: 20.sp, fontWeight: FontWeight.bold)),
        //     Text('NOW', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
        //   ],
        // ),
        child: Image(
          height: 45,
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
