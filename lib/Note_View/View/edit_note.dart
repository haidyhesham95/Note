import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_utils/styles/colors.dart';
import '../Widget/const_button.dart';
import '../Widget/const_text_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.docId, required this.oldTitle, required this.oldSubTitle,  });
final String docId;
  final String  oldTitle;
  final String  oldSubTitle;


  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, subTitle;

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> editNote() {
    return notes
        .doc(widget.docId)
        .update({
      "name": title,
      "content": subTitle,
    })
        .then((value) => print("Note Edit"))
        .catchError((error) => print("Failed to edit note: $error"));
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
      body:   SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 20.h,),
            Center(
              child: Container(
                height: 550.h > 550 ? 550.h : 550 ,
                width:  300.w > 200 ? 320.w : 300 ,
                decoration: const BoxDecoration(
                    color: ColorsAsset.kGround,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 80.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                               ConstTextField(
                                 onChanged: (value) {
                                title = value;
                              },
                                hintText:widget.oldTitle
                               ),

                              SizedBox(height: 20.h,),
                               ConstTextField(
                                onChanged: (value) {
                                  subTitle = value;
                                },
                                hintText:widget.oldSubTitle,
                                 maxLines: 5,
                              ),
                              SizedBox(height: 80.h,),
                              ConstButton(text: 'Edit',height: 40.h,
                              onTap:(){
                                Future(() async {
                                  await editNote();
                                  print("Note Edit");
                                }).then((_) {
                                  Navigator.of(context).pop();
                                });

                              } ,)






                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
