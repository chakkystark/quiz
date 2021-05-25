import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notecard.dart';
import 'notesoperations.dart';

class AllNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text(
          'View All Notes',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Consumer<NotesOperation>(
            builder: (context, value, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.getNotes.length,
                  itemBuilder: (ctx, index) => NoteCard(value.getNotes[index]));
            },
          ),
        ),
      ),
    );
  }
}
