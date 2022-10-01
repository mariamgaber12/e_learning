import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components.dart';

Widget homeCard(
        {required onTap,
        required title,
        required double width1,
        required icon}) =>
    Container(
      padding: const EdgeInsets.all(5),
      height: 140,
      width: width1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 7,
          shadowColor: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                child: SvgPicture.asset(icon,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                    color: mainColor),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                title,
                style: textstyle.copyWith(
                    color: mainColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
