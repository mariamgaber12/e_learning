import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/colors.dart';

Widget newsCard(
        {required onTapC,
        required onTapS,
        required onTap,
        required backImage,
        required title,
        required describtion}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350]!,
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 23.5),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onTapS,
                        child: SvgPicture.asset(
                          'assets/icons/share.svg',
                          height: 22,
                          width: 22,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 35,
                          width: .8,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTapC,
                        child: SvgPicture.asset(
                          'assets/icons/copy.svg',
                          height: 22,
                          width: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(backImage, height: 200, fit: BoxFit.cover),
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    describtion,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
