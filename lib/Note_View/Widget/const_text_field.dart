import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';

class ConstTextField extends StatelessWidget {
  const ConstTextField({super.key, required this.hintText, this.maxLines=1, this.onSaved, this.onChanged});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
 final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: TextFormField(
        onChanged:onChanged ,
        onSaved: onSaved,
        maxLines: maxLines,
        validator: (value){
          if (value?.isEmpty ?? true){
            return 'Field is required';
          }else{
            return null;
          }
        },
        cursorColor: ColorsAsset.kBrown,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:TextStyle(
              color: Colors.brown.shade300
          ),
          fillColor: ColorsAsset.kWhite,

          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: ColorsAsset.kBrown,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: ColorsAsset.kBrown,
                width:1.5,
              )
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(18),
        ),

      ),
    );
  }
}
