import 'package:flutter/material.dart';

import '../../../cubit/notes/notes_cubit.dart';


Widget noteTaskFormField({
  required TextEditingController controller,
  //required validate,
  required double height,
  required String hint,
  int lines=1,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: height,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          maxLines: lines,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          //validator: validate,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500),
            filled: true,
            fillColor: Colors.white,
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal[300]!),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal[300]!),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            ),
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal[300]!),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            ),
          ),
        ),
      ),
    );


Widget noteButton({required onTap,required icon,required String name}){
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(
          left: 144, right: 144, top: 20, bottom: 20),
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(icon),
            const SizedBox(
              width: 5,
            ),
            Text(
              name,
            ),
          ],
        ),
      ),
    ),
  );
}


Widget buildNoteItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  onDismissed: (direction) {
    NoteCubit.get(context).deletDB(
      id: model['id'],
    );
  },
);
