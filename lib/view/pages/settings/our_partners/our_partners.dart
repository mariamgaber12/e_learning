import 'package:e_learning/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:  Icon(Icons.arrow_back_ios,color: mainColor,),
        ),
        title: Text('Our Partners',  style: GoogleFonts.poppins(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600),),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      //stops: const [1,2.5,8],
                      colors: [
                        Colors.grey[500]!,
                        Colors.white,
                        Colors.grey[500]!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(0.0, 0.0,),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                    ]
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ODCs',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 23.5),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10,left: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png',
                      height: 240, width: 400, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
