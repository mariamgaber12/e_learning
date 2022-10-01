import 'package:e_learning/view_model/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../res/consts.dart';
import '../../view/pages/home/home.dart';
import '../../view/pages/news/news.dart';
import '../../view/pages/settings/setting.dart';
import '../../view_model/model/grade/grades.dart';
import '../../view_model/model/news/news.dart';
import '../../view_model/model/unvirsity/unvirsity.dart';
import '../../view_model/network/dio_helper.dart';
import 'main_state.dart';


class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);


  List<Widget> homeScreens = [
    const Home(),
    const NewsScreen(),
    const SettingScreen(),
  ];


  int currentNavBarItem = 0;
  void changeCurrentNavBarItem(int index) {
    currentNavBarItem = index;
    if(index==0) {
      const Home();
    }
    if(index==1) {
      const NewsScreen();
    }
    if(index==2) {
      const SettingScreen();
    }
    emit(ChangeBottomNavBar());
  }

  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  void changeVisiblePassword1(){
    passwordVisible1 = !passwordVisible1;
    emit(ChangeVisiblePassword());
  }

  void changeVisiblePassword2(){
    passwordVisible2 = !passwordVisible2;
    emit(ChangeVisiblePassword());
  }

  String? dropdownValue="";
  void getDropDown({required value}){
    dropdownValue = value;
    emit(DropdownList());
  }
/*
  University? university ;
  void getUniversity() {
    emit(GetUniversityLoadingState());
    DioHelper.getData(
      url: universityEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      university = University.fromJson(value.data);
      emit(GetUniversitySuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUniversityErrorState());
    });
  }

  Grade? grade ;
  void getGrades() {
    emit(GetGradeLoadingState());
    DioHelper.getData(
      url: gradeEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      grade = Grade.fromJson(value.data);
      emit(GetGradeSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetGradeErrorState());
    });
  }
*/

  News? news ;
  void getNews() {
    emit(GetAllNewsLoadingState());
    DioHelper.getData(
      url: newsEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      news = News.fromJson(value.data);
      emit(GetAllNewsSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllNewsErrorState());
    });
  }


}