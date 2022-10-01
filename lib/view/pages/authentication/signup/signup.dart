import 'package:e_learning/cubit/main/main_cubit.dart';
import 'package:e_learning/cubit/main/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../res/colors.dart';
import '../../../components/auth/components.dart';
import '../../../components/components.dart';
import '../login/login.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final List<String>? genderList = <String>['Male', 'Female'];
  String genderDropdownValue = 'Male';
  final List<String>? universityList = <String>['AUC','Cairo','ELU','GUC','Helwan','HTI'];
  String universityDropdownValue = 'AUC';
  final List<String>? gradeList = <String>['Grade 1', 'Grade 2', 'Grade 3' , 'Grade 4', 'Grade 5'];
  String gradeDropdownValue = 'Grade 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainCubit(),
        child: SingleChildScrollView(
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
                        'Sign Up',
                        style: textstyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w100),
                      ),
                    ),
                  ],
                ),
                BlocConsumer<MainCubit, MainState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var mainCubit = MainCubit.get(context);
                    return Column(
                      children: [
                        defaultTaskFormField(
                            controller: nameController,
                            hint: 'Name',
                            type: TextInputType.name),
                        defaultTaskFormField(
                            controller: emailController,
                            hint: 'E-Mail',
                            type: TextInputType.emailAddress),
                        defaultTaskFormField(
                            controller: passController,
                            hint: 'Password',
                            obscure: !mainCubit.passwordVisible1,
                            suffixIcon: IconButton(
                              icon: Icon(mainCubit.passwordVisible1 == true
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                mainCubit.changeVisiblePassword1();
                              },
                              color: mainColor,
                            ),
                            type: TextInputType.visiblePassword),
                        defaultTaskFormField(
                            controller: conPassController,
                            hint: 'Confirm Password',
                            obscure: !mainCubit.passwordVisible2,
                            suffixIcon: IconButton(
                              icon: Icon(mainCubit.passwordVisible2 == true
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                mainCubit.changeVisiblePassword2();
                              },
                              color: mainColor,
                            ),
                            type: TextInputType.visiblePassword),
                        defaultTaskFormField(
                            controller: phoneController,
                            hint: 'Phone Number',
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Gender',
                                      style: textstyle.copyWith(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    buildDropdown(
                                      list: genderList!,
                                      onChange: (value) {
                                        setState(()=>genderDropdownValue = value);
                                      },
                                      dropdownValue: genderDropdownValue
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 85,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'University',
                                      style: textstyle.copyWith(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    buildDropdown(
                                      list:  universityList!,
                                      dropdownValue: universityDropdownValue,
                                      onChange: (value) {
                                        setState(()=>genderDropdownValue = value);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Grade',
                                  style: textstyle.copyWith(
                                      color: Colors.black, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                buildDropdown(
                                  list: gradeList!,
                                  onChange: ( value) {
                                    setState(()=>genderDropdownValue = value);
                                  },
                                  dropdownValue: gradeDropdownValue
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        buildButton(
                            name: 'Sign Up',
                            onPress: () {
                              navigateTo(context, const LoginScreen());
                            }),
                      ],
                    );
                  },
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
                    name: 'Login',
                    onPress: () {
                      navigateTo(context, const LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
