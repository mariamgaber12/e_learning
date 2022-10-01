import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_learning/cubit/notes/notes_cubit.dart';
import 'package:e_learning/cubit/notes/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import '../../components/notes/components.dart';
import 'add_notes.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  static List<Map>? tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Notes',
          style: textstyle.copyWith(fontSize: 22, color: Colors.black),
        ),
      ),
      body: BlocProvider(
  create: (context) => NoteCubit(),
  child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<NoteCubit, NoteStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return ConditionalBuilder(
            condition: false,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) {
                return buildNoteItem(tasks![index], context);
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: 1,
            ),
            fallback: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "There's No Data To Show",
                    style: textstyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                  )),
                ],
              ),
            ),
          );
  },
),
        ],
      ),
),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade300,
        splashColor: Colors.grey.shade200,
        onPressed: () {
          navigateTo(context, AddNotes());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
