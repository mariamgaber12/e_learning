import 'package:e_learning/cubit/notes/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/notes/notes_cubit.dart';
import '../../components/components.dart';
import '../../components/notes/components.dart';

class AddNotes extends StatelessWidget {
  AddNotes({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    dateController.text = date.toString();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Add Note',
          style: textstyle.copyWith(fontSize: 22, color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => NoteCubit(),
        child: ListView(
          children: [
            noteTaskFormField(
                controller: titleController,
                //validate:(){},
                hint: 'Title',
                height: 70.0),
            noteTaskFormField(
                height: 70.0,
                controller: dateController,
                //validate:(){},
                hint: 'Date'),
            noteTaskFormField(
                controller: noteController,
                //validate:(){},
                lines: 7,
                hint: 'Note',
                height: 150.0),
            BlocConsumer<NoteCubit, NoteStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var noteCubit = NoteCubit.get(context);
                return noteButton(
                    onTap: () {
                      noteCubit.insertdb(
                          title: titleController.text,
                          description: noteController.text,
                          date: dateController.text,
                          context: context);
                    },
                    icon: Icons.add,
                    name: 'Add');
              },
            ),
          ],
        ),
      ),
    );
  }
}
