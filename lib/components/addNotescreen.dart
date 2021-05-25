import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/components/notesoperations.dart';

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titleText;
    var descriptionText;

    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Add New Notes'),
          elevation: 10,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  hintText: 'Enter Note Title',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                onChanged: (value) {
                  titleText = value;
                },
              ),
              SizedBox(height: 50),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintText: 'Enter Note Description',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black),
                  onChanged: (value) {
                    descriptionText = value;
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNotes(titleText, descriptionText);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.login),
                label: Text(
                  'ADD NOTE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[600]),
                ),
              )
            ],
          ),
        ));
  }
}
