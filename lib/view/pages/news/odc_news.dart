import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ODCNews extends StatelessWidget {
  final String date;
  final String title;
  final String desc;
  final String image;

  const ODCNews(
      {Key? key,
      required this.date,
      required this.title,
      required this.desc,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.white,
                child: Image.asset(image),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: .5,
                              color: Colors.grey[350]!,
                              spreadRadius: .9)
                        ],
                      ),
                      child: CircleAvatar(
                          radius: 20,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 2.5, bottom: 10),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios,
                                    size: 30, color: mainColor)),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 22, bottom: 25),
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            date,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        desc,
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
