import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared_utils/styles/Text.dart';
import '../../shared_utils/styles/colors.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.date, required this.title, required this.content, this.onTapDelete, this.onTapEdit,});
final String date;
  final String title;
  final String content;
  final void Function()? onTapDelete;
  final void Function()? onTapEdit;

  @override

  Widget build(BuildContext context) {

    return Container(
          decoration: const BoxDecoration(
            color: ColorsAsset.kGround,
                borderRadius: BorderRadius.all(Radius.circular(15)),

          ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTapEdit,
                  child: const Icon(Icons.edit,size: 20,),

                ),
                GestureDetector(
                  onTap:onTapDelete,
                  child: const Icon(Icons.close,size: 20,),

                ),


              ],
            ),
            SizedBox(height: 10.h,),
             Text(title,
                 maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style:Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)
                    ),
        SizedBox(height: 20.h,),

        Text(
            content,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Styles.textStyle15
        ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
              date,style: Styles.textStyle15.copyWith(color: Colors.grey),),
            )

          ],
        ),
      ),
    );
  }
}
