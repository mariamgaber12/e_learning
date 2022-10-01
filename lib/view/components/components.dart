import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colors.dart';

Widget myDriver() => Padding(
      padding: const EdgeInsets.only(left: 20, right: 25,),
      child: Divider(
        color: Colors.grey[400]!,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

TextStyle textstyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

Widget myLine(
        {double left = 5,
        double? right = 5,
        required double width,
        double top = 2.0}) =>
    Padding(
      padding: EdgeInsets.only(
          left: left = 5, right: right = 5, top: 20, bottom: 15),
      child: Container(
        height: 1,
        width: width,
        color: Colors.grey,
      ),
    );

Widget defaultTaskFormField({
  required TextEditingController controller,
  //required validate,
  required String hint,
  required type,
  bool obscure=false,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6, left: 25, right: 25),
      child: Container(
        width: double.infinity,
        height: 66,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: obscure,
          keyboardType: type,
          textInputAction: TextInputAction.next,
          //validator: validate,
          decoration: InputDecoration(
            labelText: hint,
            suffixIcon: suffixIcon,
            labelStyle: textstyle.copyWith(
                color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 12),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: mainColor),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
