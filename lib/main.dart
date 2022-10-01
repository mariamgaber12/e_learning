import 'package:e_learning/cubit/main/main_cubit.dart';
import 'package:e_learning/view/pages/authentication/splash.dart';
import 'package:e_learning/view_model/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/authentication/auth_cubit.dart';
import 'cubit/lectures/lecture_cubit.dart';
import 'cubit/news/news_cubit.dart';
import 'cubit/notes/notes_cubit.dart';
import 'cubit/settings/settings_cubit.dart';
import 'view_model/sql/sql_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SqlHelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationCubit(),
          ),
          BlocProvider(
            create: (context) => NewsCubit()..getNews(),
          ),
          BlocProvider(
            create: (context) => SettingsCubit()..getFAQ()..getTerms(),
          ),
          BlocProvider(
            create: (context) => LectureCubit(),
          ),
          BlocProvider(
            create: (context) => NoteCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
              )),
          home: const Splash(),
        ));
  }
}
