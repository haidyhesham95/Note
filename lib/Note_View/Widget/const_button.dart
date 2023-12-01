import 'package:flutter/cupertino.dart';
import '../../../../shared_utils/styles/Text.dart';
import '../../../../shared_utils/styles/colors.dart';

class ConstButton extends StatelessWidget {
  const ConstButton({super.key, this.width, this.height, required this.text, this.onTap});
 final double? width;
 final double? height;
 final String text;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
        color: ColorsAsset.kBrown,
          borderRadius: BorderRadius.circular(18),
        ),
        child:  Center(child: Text(text,style: Styles.textStyle10sp,)),
      ),
    );
  }
}
