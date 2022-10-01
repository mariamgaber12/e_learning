import 'package:e_learning/cubit/news/news_state.dart';
import 'package:e_learning/res/colors.dart';
import 'package:e_learning/view/components/components.dart';
import 'package:e_learning/view/pages/news/odc_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../cubit/news/news_cubit.dart';
import '../../components/news/components.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 2,
        ),
        title: Text(
          'News',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => NewsCubit()..getNews(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var newsCubit = NewsCubit.get(context);
            return  newsCard(
                        onTapC: () {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.info(
                              backgroundColor: Colors.orange,
                              message: "Text Copied",
                            ),
                          );
                        },
                        onTapS: () {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.info(
                              backgroundColor: Colors.green,
                              message: "Share now",
                            ),
                          );
                        },
                        onTap: () {
                          navigateTo(
                              context,
                              const ODCNews(
                                title: 'ODC',
                                image: 'assets/images/logo.png',
                                desc: 'ODC Supports All Universities',
                                date: '2022-07-06',
                              ));
                        },
                        title: 'ODC',
                        backImage: 'assets/images/logo.png',
                        describtion: 'ODC Supports All Universities',
                      );}
        ),
      ),
    );
  }
}
