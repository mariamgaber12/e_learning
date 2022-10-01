import 'package:e_learning/res/consts.dart';
import 'package:e_learning/view_model/model/section/sections.dart';
import 'package:e_learning/view_model/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/model/exam/finals.dart';
import '../../view_model/model/lecture/lecture.dart';
import '../../view_model/network/dio_helper.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState>{

  LectureCubit() : super(LectureInitial());

  static LectureCubit get(context) => BlocProvider.of(context);


  Lecture? lectures ;
  void getLectures() {
    emit(GetAllLectureLoadingState());
    DioHelper.getData(
      url: lectureEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      lectures = Lecture.fromJson(value.data);
      emit(GetAllLectureSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllLectureErrorState());
    });
  }

  Section? sections ;
  void getSections() {
    emit(GetAllLectureLoadingState());
    DioHelper.getData(
      url: sectionEndPoint,
      token: accessToken,
    ).then((value) {
      print(value.statusMessage);
      sections = Section.fromJson(value.data);
      emit(GetAllLectureSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllLectureErrorState());
    });
  }

  Exam? exams;
  void getExams() {
    emit(GetAllLectureLoadingState());
    DioHelper.getData(
      url: examsEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      exams = Exam.fromJson(value.data);
      emit(GetAllLectureSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllLectureErrorState());
    });
  }

}