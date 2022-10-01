import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/lectures/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../cubit/lectures/lecture_cubit.dart';
import '../../../cubit/lectures/lecture_state.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool state=true;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: mainColor,),
        ),
        title: Text('Finals',  style: GoogleFonts.poppins(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600),),
        centerTitle: true,
        elevation: 7,
        actions: [
          popButton(
              state: state=true
          ),
          const Text('    '),
        ],
      ),
      body: BlocProvider(
        create: (context) => LectureCubit()..getExams(),
        child: BlocConsumer<LectureCubit, LectureState>(
          listener: (context, state) {},
          builder: (context, state) {
            var lecCubit = LectureCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                state == true
                    ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('No Finals')],
                    ))
                    :lecCubit.exams == null
                    ? Center(
                  child: CircularProgressIndicator(color: mainColor,),
                )
                    : ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    int end = lecCubit.exams!.data![index]
                        .examEndTime! as int;
                    int start = lecCubit.exams!.data![index]
                        .examStartTime! as int;
                    int duration = end - start;
                    return lecCard(
                        title: lecCubit
                            .exams!.data![index].examSubject!,
                        duration: '$duration',
                        day: lecCubit
                            .exams!.data![index].examDate!,
                        startTime: lecCubit.exams!.data![index]
                            .examStartTime!,
                        endTime: lecCubit.exams!.data![index]
                            .examStartTime!);
                  },
                  itemCount: lecCubit.exams!.data!.length,
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
}
