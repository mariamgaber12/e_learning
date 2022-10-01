import 'package:dio/dio.dart';
import 'package:e_learning/res/consts.dart';
import 'package:e_learning/view_model/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../view/pages/home/home.dart';
import '../../view/pages/home_layout.dart';
import '../../view/pages/news/news.dart';
import '../../view/pages/settings/setting.dart';
import '../../view_model/network/dio_helper.dart';
import 'auth_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(LoginInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    const Home(),
    const NewsScreen(),
    const SettingScreen(),
  ];

  int currentNavBarItem = 0;
  void changeCurrentNavBarItem(int index) {
    currentNavBarItem = index;
    if (index == 0) {
      const Home();
    }
    if (index == 1) {
      const NewsScreen();
    }
    if (index == 2) {
      const SettingScreen();
    }
    emit(ChangeBottomNavBar());
  }//AuthenticationModel? loginResponse;


  Future<void> login(String email, String password, context) async {
    var data = {"email": email, "password": password};
    await DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        accessToken=value.data;
        print(accessToken);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeLayout() as Widget,
          ),
        );

        showTopSnackBar(
          context,
          const CustomSnackBar.info(
            backgroundColor: Colors.green,
            message: "Welcome back",
          ),
        );

      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error Login !!!!!!!!!!${value.statusCode}");
      }
    });
  }


  void createUser(
      {required String firstName,
        required String lastName,
        required String email,
        required String password}) {
    emit(CreateUserLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    }).then((value) {
      accessToken=value.data;
      print(accessToken);
      emit(CreateUserSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        emit(CreateUserErrorState(
            message: error.response!.data["message"].toString()));
      }
    });
  }

}
