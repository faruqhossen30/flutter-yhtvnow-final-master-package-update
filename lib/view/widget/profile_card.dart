import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ProfileCard extends StatelessWidget{
  String title;
  IconData cardIcon;
  VoidCallback callBack;

  ProfileCard({
    super.key,
    required this.title,
    required this.cardIcon,
    required this.callBack,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.callBack,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white70),
        ),
        child: Row(
          children: [
            Icon(
              cardIcon,
              color: Colors.white70,
              size: 25.sp,
            ),
            SizedBox(width: 10,),
            Text(this.title, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}