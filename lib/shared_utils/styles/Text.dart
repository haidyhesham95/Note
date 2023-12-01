import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';





abstract class Styles {

  static TextStyle textStyle30 = GoogleFonts.dosis(
    fontSize: 30,
    fontWeight: FontWeight.bold,

  ) ;

  static TextStyle textStyle15 = GoogleFonts.dosis(
    fontSize: 15,

  ) ;
  static TextStyle textStyle15grey = GoogleFonts.dosis(

    fontSize: 15,
    color: Colors.grey


  ) ;
  static TextStyle textStyle15black = GoogleFonts.dosis(

    fontSize: 15,
    color: Colors.black


  ) ;

  static TextStyle textStyle18 = GoogleFonts.dosis(

    fontSize: 18,


  ) ;
  static TextStyle textStyle28= GoogleFonts.courgette(

    fontSize: 28,

  );
  static TextStyle textStyle35= GoogleFonts.courgette(

    fontSize: 35,

  );

  static TextStyle textStyle20= GoogleFonts.dosis(

    fontSize: 20.sp,


  );static TextStyle textStyle20white= GoogleFonts.dosis(

    fontSize: 20,
    color: Colors.white


  );
  static TextStyle textStyle25= GoogleFonts.dosis(
   // color: Colors.black,

    fontSize: 25,

  );static TextStyle textStyle25Bold= GoogleFonts.dosis(
   // color: Colors.black,

    fontSize: 25,
    fontWeight: FontWeight.bold

  );

  static TextStyle textStyle315sp = GoogleFonts.dosis(
    fontSize: 15 > 3.sp ? 15 : 3.sp,
  );


  static TextStyle textStyle318sp = GoogleFonts.dosis(
    fontSize: 3.sp > 18 ? 3.sp : 18,
  );


  static TextStyle textStyle10sp =
  GoogleFonts.dosis(fontSize: 10.sp > 25 ? 10.sp : 25,
      color: ColorsAsset.kWhite
  );








}

TextStyle googleFonts = GoogleFonts.dosis();

