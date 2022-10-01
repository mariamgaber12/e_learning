import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/home/components.dart';
import 'package:e_learning/view/pages/finals/final.dart';
import 'package:e_learning/view/pages/lectures/lectures.dart';
import 'package:e_learning/view/pages/sections/section.dart';
import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../events/event.dart';
import '../midterms/midterm.dart';
import '../notes/notes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Orange',
                style: textstyle.copyWith(
                    color: mainColor, fontSize: 22),
              ),
              Text(' Digital Center', style: textstyle.copyWith(fontSize: 22)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  homeCard(
                      title: 'Lectures',
                      icon: 'assets/icons/lecture.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context,  const Lectures());
                      }),
                  homeCard(
                      title: 'Midterms',
                      icon: 'assets/icons/midterm.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context, const MidtermScreen());
                      }),
                  homeCard(
                      title: 'Events',
                      icon: 'assets/icons/event.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context,  Events());
                      }),
                ],
              ),
              Column(
                children: [
                  homeCard(
                      title: 'Sections',
                      icon: 'assets/icons/sections.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context, const SectionScreen());
                      }),
                  homeCard(
                      title: 'Finals',
                      icon: 'assets/icons/final.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context, const FinalScreen());
                      }),
                  homeCard(
                      title: 'Notes',
                      icon: 'assets/icons/notes.svg',
                      width1: width,
                      onTap: () {
                        navigateTo(context, const NotesScreen());
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
