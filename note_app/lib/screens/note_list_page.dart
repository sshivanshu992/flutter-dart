import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/db/database.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/edit_page.dart';
import 'package:note_app/screens/note_details_page.dart';
import 'package:note_app/widgets/card_widget.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : notes.isEmpty
                ? const Text(
                    'No Notes Added yet',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : buildNote(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );
            refreshNotes();
          }),
    );
  }

  Widget buildNote() => MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteDetails(noteId: notes[index].id!),
                ),
              );
              refreshNotes();
            },
            child: CardWidget(note: notes[index], index: index),
          );
        },
      );

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NoteDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    NoteDatabase.instance.close();
    super.dispose();
  }
}
