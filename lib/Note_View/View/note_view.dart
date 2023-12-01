import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../Widget/floating_button_note.dart';
import '../Widget/note_gridview.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsAsset.kWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsAsset.kWhite,
          centerTitle: true,
          title: Image.asset(
            "assets/appbar.png",
            height: 50,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 8.w, right: 8.w,bottom: 10.h),
          child: const NoteGrid(),
        ),
        floatingActionButton: const FloatingButtonNote());
  }
}
