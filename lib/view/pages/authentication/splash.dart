import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/components.dart';
import 'package:e_learning/view/pages/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 220,),
          Image.asset('assets/images/logo.png'),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              onAnimationEnd: (){navigateTo(context, LoginScreen());},
              lineHeight: 7.0,
              curve: Curves.linear,
              clipLinearGradient: true,
              barRadius: Radius.circular(15),
              animationDuration: 400,
              percent: 1,
              animateFromLastPercent: true,
              progressColor: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
