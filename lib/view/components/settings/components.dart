import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_html_css/simple_html_css.dart';

Widget settingList({required onPress, required title}) => GestureDetector(
  onTap: onPress,
  child:   ListTile(
    title: Text(title,style: GoogleFonts.poppins(fontSize: 14),),
    trailing: IconButton(
      onPressed: onPress,
      icon: const Icon(Icons.arrow_forward_ios,color: Colors.black87,),
    ),

  ),
);

Widget supportTaskFormField({
  required TextEditingController controller,
  prefix,
  required double height1,
  required String hint,
  required type,
  lines = 1,
  Widget? suffixIcon,}) => Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6, left: 18, right: 18),
      child: SizedBox(
        width: double.infinity,
        height: height1,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          keyboardType: type,
          maxLines: lines,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: TextDirection.ltr,
            prefixIcon: Icon(
              prefix,
              color: Colors.grey,
            ),
            hintStyle: GoogleFonts.poppins(color: Colors.grey[800], fontSize: 15),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54,width: 1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: mainColor,width: 1.8),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54,width: 1),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );

Widget settingButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 8),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: 125,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
        ),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Widget settingOutlineButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 8,right: 10),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: 125,
        height: 38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.2,color: mainColor),
            color: Colors.white),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: mainColor),
          ),
        ),
      ),
    ),
  );
}


Widget dropFAQ({context,required onTap, required icon,required question}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 12,
             child: RichText(
                  text: HTML.toTextSpan(context,
                      question,
                      linksCallback: (link) {},
                      defaultTextStyle:
                      GoogleFonts.poppins(fontSize: 15.8, color: Colors.white),
                      overrideStyle: {
                        "p":   GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w400),
                        "a":   GoogleFonts.poppins(wordSpacing: 2,fontWeight: FontWeight.w200),
                      })),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: IconButton(onPressed: onTap, icon: icon),
            )
          ],
        ),
      ),
    ),
  );
}

Widget showFAQ({context,required String answer}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
      padding: EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: HTML.toTextSpan(context,
                  answer,
                  linksCallback: (link) {},
                  defaultTextStyle:
                  GoogleFonts.poppins(fontSize: 17, color: Colors.white)
                  ,overrideStyle: {
                    "p":   GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w400),
                    "a":   GoogleFonts.poppins(wordSpacing: 2,fontWeight: FontWeight.w200),
                  })),
        ],
      ),
    ),
  );
}