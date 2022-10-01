import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/colors.dart';
import '../components.dart';

Widget buildButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 10,left: 20,right: 20),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
        ),
        child: Center(
          child: Text(
            name,
            style: textstyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Widget buildOutlineButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 10,left: 25,right: 25),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.2,color: mainColor),
            color: Colors.white),
        child: Center(
          child: Text(
            name,
            style: textstyle.copyWith(color: mainColor),
          ),
        ),
      ),
    ),
  );
}

Widget buildDropdown({required list,required onChange, required dropdownValue}){
  return Container(
    padding: const EdgeInsets.only(right: 10,left: 10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent.shade100,width: 1.3),
        borderRadius: BorderRadius.circular(15)
    ),
    child: DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style:   TextStyle(color: mainColor),
      underline: Container(height: 0.001, color: Colors.white,),
      onChanged: onChange,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: GoogleFonts.poppins(color: Colors.black,fontSize: 13),),
        );
      }).toList(),
    ),
  );
}