import 'package:e_learning/cubit/authentication/auth_cubit.dart';
import 'package:e_learning/cubit/authentication/auth_states.dart';
import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/auth/components.dart';
import '../../../components/components.dart';
import '../signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Orange',
                        style: textstyle.copyWith(
                            fontSize: 28,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' Digital Center',
                        style: textstyle.copyWith(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Login',
                          style: textstyle.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w100),
                        ),
                      ),
                    ],
                  ),
                  defaultTaskFormField(
                      controller: emailController,
                      hint: 'E-Mail',
                      type: TextInputType.emailAddress),
                  defaultTaskFormField(
                      controller: passController,
                      hint: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        color: mainColor,
                      ),
                      type: TextInputType.visiblePassword),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: textstyle.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: mainColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocProvider(
                    create: (context) => AuthenticationCubit(),
                    child: BlocConsumer<AuthenticationCubit,
                        AuthenticationState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var authCubit = AuthenticationCubit.get(context);
                        return buildButton(
                            name: 'Login',
                            onPress: () {
                              authCubit.login(
                                  emailController.text, passController.text,
                                  context);
                            });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myLine(width: 135, left: 20, right: 20),
                      Text(
                        'OR',
                        style: textstyle.copyWith(
                            color: Colors.black87, fontSize: 15),
                      ),
                      myLine(width: 135, left: 20, right: 20),
                    ],
                  ),
                  buildOutlineButton(
                      name: 'Sign Up',
                      onPress: () {
                        navigateTo(context,  SignupScreen());
                      }),
                ],
              )
          ),
        )
    );
  }
}
