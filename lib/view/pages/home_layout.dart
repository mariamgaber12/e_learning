import 'package:e_learning/cubit/main/main_state.dart';
import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../cubit/main/main_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => MainCubit(),
  child: BlocConsumer <MainCubit,MainState >(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var homeCubit =  MainCubit.get(context);
        return Scaffold(
          body: homeCubit.homeScreens[homeCubit.currentNavBarItem],
          bottomNavigationBar: Container(
            //width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey[350]!,
                  offset: const Offset(0.0, 0.0,),
                  blurRadius: 7,
                  spreadRadius: 1.5,
                ),
              ],
            ),
            child: GNav(
                onTabChange: (index){
                  homeCubit.changeCurrentNavBarItem(index);},
                rippleColor: Colors.grey[500]!,
                hoverColor: Colors.grey[500]!,
                haptic: true,
                tabBorderRadius: 25,
                tabActiveBorder: Border.all(color: Colors.grey.shade300, width: .005), // tab button border
                tabBorder: Border.all(color: Colors.grey.shade100), // tab button border
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 300),
                gap: 6,
                color: Colors.grey[800],
                iconSize: 28,
                activeColor:mainColor,
                //iconSize: 30,
                tabBackgroundColor: Colors.grey.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), // navigation bar padding
                tabs:   const [
                  GButton(
                    //leading: SvgPicture.asset('assets/icons/home.svg',color: Colors.grey[800],),
                    icon: Icons.home_outlined,
                    //iconColor: Colors.white,
                    text: 'Home',
                  ),
                  GButton(
                    //leading: SvgPicture.asset('assets/icons/news.svg',height: 30,width: 25,color: Colors.black,),
                    icon: Icons.calendar_month_outlined,
                    //iconColor: Colors.white,
                    text: 'News',
                  ),
                  GButton(
                    //leading: SvgPicture.asset('assets/icons/settings.svg',color: Colors.grey[800],),
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                    //iconColor: Colors.white,
                  ),
                ]
            ),
          ),
        ); },
    ),
);
  }
}
