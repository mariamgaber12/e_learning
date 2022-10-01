import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontStyle = GoogleFonts.poppins(
  fontSize: 13,
);

Widget lecCard({
  required String title,
  required String duration,
  required String day,
  required String startTime,
  required String endTime,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
      ),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: fontStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: Colors.grey.shade800,
                  ),
                  Text(
                    '${duration}hrs',
                    style: fontStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lecture Day',
                        style: fontStyle.copyWith(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/event.svg',
                            height: 25,
                            width: 25,
                            color: Colors.black,
                          ),
                          Text(
                            ' $day',
                            style: fontStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: fontStyle.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/time.svg',
                            height: 25,
                            width: 25,
                            color: Colors.greenAccent.shade700,
                          ),
                          Text(' ${startTime}pm', style: fontStyle),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: fontStyle.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/time.svg',
                            height: 25,
                            width: 25,
                            color: Colors.redAccent,
                          ),
                          Text(' ${endTime}pm', style: fontStyle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget popButton({required filterList,required state, required onSelect}) {

  return PopupMenuButton(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: filterList[0],
        child: Text(filterList[0]),
      ),
      PopupMenuItem(
        value: filterList[1],
        child: Text(filterList[1]),
      ),
      PopupMenuItem(
        value: filterList[2],
        child: Text(filterList[2]),
      ),
    ],
    onSelected: onSelect,
    child: SvgPicture.asset(
      'assets/icons/filter.svg',
      color: mainColor,
      width: 30,
      height: 25,
    )
  );
}
