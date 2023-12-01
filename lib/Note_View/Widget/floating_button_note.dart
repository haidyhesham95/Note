import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_utils/styles/colors.dart';
import 'add_note.dart';

class FloatingButtonNote extends StatelessWidget {
  const FloatingButtonNote({super.key,
  });



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom: 15.h,),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsAsset.kBrown,

        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              context: context, builder: (context){
            return const AddNote();
          });
        },
        child: const Icon(Icons.add,size: 30,),

      ),
    );
  }
}
