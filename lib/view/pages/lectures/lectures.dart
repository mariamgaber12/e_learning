import 'package:e_learning/cubit/lectures/lecture_cubit.dart';
import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/lectures/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../cubit/lectures/lecture_state.dart';

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  final GlobalKey _menuKey = GlobalKey();



  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
        ),
        title: Text(
          'Lectures',
          style: GoogleFonts.poppins(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 7,
        actions: [
          popButton(
           state: state
          ),
          const Text('    '),
        ],
      ),
      body: BlocProvider(
        create: (context) => LectureCubit()..getLectures(),
        child: BlocConsumer<LectureCubit, LectureState>(
          listener: (context, state) {},
          builder: (context, state) {
            var lecCubit = LectureCubit.get(context);
            return Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                state == true
                    ? Center(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text('No Lectures')],
                      ))
                    : lecCubit.lectures == null
                        ? Center(
                            child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              int end = lecCubit
                                  .lectures!.data![index].lectureEndTime! as int;
                              int start = lecCubit
                                  .lectures!.data![index].lectureStartTime! as int;
                              int duration = end - start;
                              return lecCard(
                                  title: lecCubit
                                      .lectures!.data![index].lectureSubject!,
                                  duration: '$duration',
                                  day: lecCubit.lectures!.data![index].lectureDate!,
                                  startTime: lecCubit
                                      .lectures!.data![index].lectureStartTime!,
                                  endTime: lecCubit
                                      .lectures!.data![index].lectureStartTime!);
                            },
                            itemCount: lecCubit.lectures!.data!.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                const SizedBox(
                              height: 2,
                            ),
                          ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget openFilter() {
    return PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_) => const <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                  value: 'All Lectures',
                  child: Text(
                    'All Lectures',
                  )),
              PopupMenuItem<String>(
                  value: 'Finished Lecture',
                  child: Text(
                    'Finished Lecture',
                  )),
              PopupMenuItem(
                  value: 'Remaining Lecture', child: Text('Remaining Lecture'))
            ],
        onSelected: (_) {});
  }
}
