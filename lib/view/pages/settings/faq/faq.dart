import 'package:e_learning/cubit/settings/settings_cubit.dart';
import 'package:e_learning/cubit/settings/settings_state.dart';
import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/settings/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isDrop = false;

  @override
  void initState() {
    super.initState();
    isDrop = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'FAQ',
          style: GoogleFonts.poppins(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var setCubit = SettingsCubit.get(context);
            return setCubit.faq == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : ListView.separated(
                    itemCount: setCubit.faq!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          dropFAQ(
                              context: context,
                              question: setCubit.faq!.data![index].question!,
                              onTap: () {
                                setState(() {
                                  isDrop = !isDrop;
                                  print(isDrop);
                                });
                              },
                              icon: isDrop == true
                                  ? const Icon(Icons.keyboard_arrow_down)
                                  : const Icon(Icons.keyboard_arrow_up)),
                          isDrop == true
                              ? showFAQ(
                                  context: context,
                                  answer: setCubit.faq!.data![index].answer!)
                              : Container(
                                  height: 400,
                                  color: Colors.white,
                                ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
