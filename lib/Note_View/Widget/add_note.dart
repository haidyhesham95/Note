import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_note_form.dart';


class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w,left: 25.w,top: 5.h,bottom: MediaQuery.of(context).viewInsets.bottom),
      child:  SingleChildScrollView(child:  AddNoteForm())

    );
  }
}
