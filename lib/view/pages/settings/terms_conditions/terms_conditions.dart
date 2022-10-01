import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_html_css/simple_html_css.dart';
import '../../../../cubit/settings/settings_cubit.dart';
import '../../../../cubit/settings/settings_state.dart';
import '../../../../res/colors.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
        ),
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.poppins(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BlocProvider(
            create: (context) => SettingsCubit()..getTerms(),
            child: BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {},
              builder: (context, state) {
                var setCubit = SettingsCubit.get(context);
                return setCubit.terms == null
                    ? Center(
                        child: CircularProgressIndicator(
                        color: mainColor,
                      ))
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:                              RichText(
                              text: HTML.toTextSpan(context,
                                  setCubit.terms!.data!.terms!.toString(),
                                  linksCallback: (link) {},
                                  defaultTextStyle:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w300,
                                      fontSize: 18,color: Colors.grey),
                                  overrideStyle: {
                                    "p":   GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w400),
                                    "a":   GoogleFonts.poppins(wordSpacing: 2,fontWeight: FontWeight.w200),
                                  })),

                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
