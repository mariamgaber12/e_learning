import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/auth/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/settings/components.dart';

class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController supportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
        ),
        title: Text(
          'Support',
          style: GoogleFonts.poppins(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          supportTaskFormField(
              controller: nameController,
              height1: 70,
              hint: 'Name',
              prefix: Icons.person,
              type: TextInputType.name),
          supportTaskFormField(
              controller: emailController,
              height1: 70,
              hint: 'E-Mail',
              prefix: Icons.email,
              type: TextInputType.emailAddress),
          supportTaskFormField(
              controller: supportController,
              height1: 170,
              lines: 99,
              hint: "What's making you unhappy?",
              type: TextInputType.text),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: buildButton(name: 'Submit', onPress: () {}),
          ),
        ],
      ),
    );
  }

}
