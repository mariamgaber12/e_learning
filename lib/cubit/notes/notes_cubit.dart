import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'states.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());

  static NoteCubit get(context) => BlocProvider.of(context);

  Database? database;
  List<Map> notes = [];

  //create DB in local
  void creatdb() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase created');
        database
            .execute(
                'create TABLE notes(id INTEGER PRIMARY KEY,title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('Table created');
        }).catchError((error) {
          print('Error when created table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getdb(database);
        print('DataBase Opened');
      },
    ).then((value) {
      database = value;
      emit(NoteCreateDB());
    });
  }

  int? id;

  //insert  in local DB
  insertdb({
    required String title,
    required String date,
    required String description,
    context,
  }) async {
    await database!.transaction((txn) async {
      id = await txn
          .rawInsert(
              'INSERT INTO notes ( title,date,description,status) VALUES ("$title","$date","$description","new")')
          .then((value) {
        print('200');
        print('$value INSERT successfully');
        Navigator.pop(context);

        showTopSnackBar(
          context,
          CustomSnackBar.info(
            backgroundColor: Colors.deepOrangeAccent.shade100,
            message: "Note Add Successfully",
          ),
        );
        emit(NoteInsertDB());
        getdb(database);
      }).catchError((error) {
        print('**************************');
        print('Error when Inserting New record ${error.toString()}');
      });
    });
  }

  //get from local DB
  void getdb(database) {
    notes = [];
    emit(NoteGetDBloadingstate());
    database.rawQuery('SELECT * FROM notes').then((value) {
      value.forEach((element) {
        notes.add(element);
      });
      emit(NoteGetDB());
    });
  }

  //update  local DB
  void updateDB({
    required String status,
    required int id,
  }) async {
    database!.rawUpdate(
      'UPDATE notes SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getdb(database);
      emit(NoteUpdateDB());
    });
  }

  //delete from local DB
  void deletDB({
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM notes WHERE id = ?', [id]).then((value) {
      getdb(database);
      emit(NoteDeleteDB());
    });
  }
}
