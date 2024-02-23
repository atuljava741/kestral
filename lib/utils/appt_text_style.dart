
import 'package:flutter/material.dart';

class AppTextStyle {

   static TextStyle getTextStylePoppins72w600 = const TextStyle(
    color:  Color(0xFF52452F),
    fontSize: 72,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 0.02,
  );

   static TextStyle textStylePoppins14w400 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 14,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,
   );

   static TextStyle textStylePoppins15w400 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 15,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,
   );

   static TextStyle textStylePoppins16w500 = const TextStyle(
     color: Colors.white,
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w500,
   );

   static TextStyle textStylePoppins16w600 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,
   );

   static TextStyle textStylePoppins12w400 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 12,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,
   );

   static TextStyle textStylePoppins18w600 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 18,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins14w600 = const TextStyle(
     color: Color(0xFF848484),
     fontSize: 14,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins19w400 = const TextStyle(
     color: Color(0xFF848484),
     fontSize: 14,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,

   );

   static TextStyle textStylePoppins17w600 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins20w600 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 14,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins21w600 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,

   );

   static TextStyle textStylePoppins22w400 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 15,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,
   );

   static TextStyle textStylePoppins72w600 = const TextStyle(
     color: Color(0xFF52452F),
     fontSize: 72,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins13w400 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 14,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,

   );

   static TextStyle textStylePoppins24w600 = const TextStyle(
     color: Color(0xFF52452F),
     fontSize: 24,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w600,
   );

   static TextStyle textStylePoppins17w500 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w500,
   );

   static TextStyle textStylePoppins26 = const TextStyle(
     color: Color(0XFFFFFFFF),
     fontSize: 26,
   );

   static TextStyle textStylePoppins18 = const TextStyle(
       color: Color(0xFF252525),
       fontSize: 18,
       fontFamily: 'Poppins',
       fontWeight: FontWeight.w600,

   );

   static TextStyle textStylePoppins15 = const TextStyle(
     color: Color(0xFF252525),
     fontSize: 15,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w400,

   );

   static TextStyle textStylePoppins16 = const TextStyle(
     color: Colors.white,
     fontSize: 16,
     fontFamily: 'Poppins',
     fontWeight: FontWeight.w500,

   );

  static getBoxDecoration() {
    return const ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x19969696),
          blurRadius: 3,
          offset: Offset(2, 0),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x16969696),
          blurRadius: 6,
          offset: Offset(6, 0),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x0C969696),
          blurRadius: 8,
          offset: Offset(14, 0),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x02969696),
          blurRadius: 10,
          offset: Offset(25, 0),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x00969696),
          blurRadius: 11,
          offset: Offset(39, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static getShapeDecoration2() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x19CDBFB2),
          blurRadius: 6,
          offset: Offset(0, 3),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x16CDBFB2),
          blurRadius: 11,
          offset: Offset(0, 11),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x0CCDBFB2),
          blurRadius: 15,
          offset: Offset(0, 25),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x02CDBFB2),
          blurRadius: 18,
          offset: Offset(0, 45),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x00CDBFB2),
          blurRadius: 20,
          offset: Offset(0, 71),
          spreadRadius: 0,
        )
      ],
    );
  }

  static getShapeDecoration3() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x19CDBFB2),
          blurRadius: 6,
          offset: Offset(0, 3),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x16CDBFB2),
          blurRadius: 11,
          offset: Offset(0, 11),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x0CCDBFB2),
          blurRadius: 15,
          offset: Offset(0, 25),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x02CDBFB2),
          blurRadius: 18,
          offset: Offset(0, 45),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x00CDBFB2),
          blurRadius: 20,
          offset: Offset(0, 71),
          spreadRadius: 0,
        )
      ],
    );
  }

   static getShapeDecoration4() {
     return ShapeDecoration(
       color: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(4),
       ),
       shadows: const [
         BoxShadow(
           color: Color(0x19CDBFB2),
           blurRadius: 6,
           offset: Offset(0, 3),
           spreadRadius: 0,
         ),
         BoxShadow(
           color: Color(0x16CDBFB2),
           blurRadius: 11,
           offset: Offset(0, 11),
           spreadRadius: 0,
         ),
         BoxShadow(
           color: Color(0x0CCDBFB2),
           blurRadius: 15,
           offset: Offset(0, 25),
           spreadRadius: 0,
         ),
         BoxShadow(
           color: Color(0x02CDBFB2),
           blurRadius: 18,
           offset: Offset(0, 45),
           spreadRadius: 0,
         ),
         BoxShadow(
           color: Color(0x00CDBFB2),
           blurRadius: 20,
           offset: Offset(0, 71),
           spreadRadius: 0,
         )
       ],
     );
   }
}
