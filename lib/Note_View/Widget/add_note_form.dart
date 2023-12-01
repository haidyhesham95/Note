import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/Note_View/Widget/top_button_sheet.dart';
import 'const_button.dart';
import 'const_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  String? title, subTitle,date;

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote() {
    return notes
        .add({
      "name": title,
      "content": subTitle,
      "date":date

    })
        .then((value) => print("Note Added"))
        .catchError((error) => print("Failed to add note: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const TopButtonSheet(),
          SizedBox(
            height: 40.h,
          ),
          ConstTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value ;
              print("Title: $title"); // Add this line for debugging
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          ConstTextField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(
            height: 40.h,
          ),
          ConstButton(
            text: 'Add',
            height: 40.h,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                // Perform the Firestore operation in the background using Future
                Future(() async {
                  await addNote();
                  print("Note Added");
                }).then((_) {
                  Navigator.of(context).pop();
                });
              } else {
                // Form validation failed
                print("Form validation failed");
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
   // Navigator.of(context).pop();


              // if (formKey.currentState!.validate()) {
              //   formKey.currentState!.save();
              //  // var currentDate = DateTime.now();
              // //  var formattedCurrentDate =  DateFormat('d-M-y').format(currentDate);
              //
              //
              // }
              // else{
              //   autovalidateMode=AutovalidateMode.always;
              //   setState(() {
              //
              //   });
              // }

          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
