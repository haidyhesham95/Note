
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopButtonSheet extends StatelessWidget {
  const TopButtonSheet({super.key, this.topPadding});
  final int? topPadding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 36.w,
        height: 4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}


