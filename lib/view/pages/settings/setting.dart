import 'package:e_learning/view/pages/settings/faq/faq.dart';
import 'package:e_learning/view/pages/settings/support/support.dart';
import 'package:e_learning/view/pages/settings/terms_conditions/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/components.dart';
import '../../components/settings/components.dart';
import '../authentication/login/login.dart';
import 'our_partners/our_partners.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 1,
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          settingList(
            title: 'FAQ',
            onPress: () {
              navigateTo(context, FAQ());
            },
          ),
          myDriver(),
          settingList(
            title: 'Terms & Conditions',
            onPress: () {
              navigateTo(context, const TermsConditions());
            },
          ),
          myDriver(),
          settingList(
            title: 'Our Partners',
            onPress: () {
              navigateTo(context, const OurPartners());
            },
          ),
          myDriver(),
          settingList(
            title: 'Support',
            onPress: () {
              navigateTo(context, Support());
            },
          ),
          myDriver(),
          settingList(
            title: 'Log out',
            onPress: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = settingOutlineButton(
        name: 'Cancel',
        onPress: () {
          Navigator.pop(context);
        });
    Widget sureButton = settingButton(
        name: 'Sure',
        onPress: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        });
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: GoogleFonts.poppins(fontSize: 20),
      ),
      content: Text(
        "Are you sure ?",
        style: GoogleFonts.poppins(fontSize: 16),
      ),
      actions: [
        Row(
          children: [
            cancelButton,
            sureButton,
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
