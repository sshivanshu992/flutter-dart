import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/db/database.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/edit_page.dart';

class NoteDetails extends StatefulWidget {
  final int noteId;
  const NoteDetails({Key? key, required this.noteId}) : super(key: key);

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  bool isLoading = false;
  late Note note;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  DateFormat.yMMMd().format(note.createdTime),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  note.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
    );
  }

  Future refreshNote() async {
    setState(() {
      isLoading = true;
    });
    note = await NoteDatabase.instance.readNote(widget.noteId);
    setState(() {
      isLoading = false;
    });
  }

  Widget editButton() {
    return IconButton(
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddEditNotePage(note: note),
          ),
        );
        refreshNote();
      },
      icon: const Icon(Icons.edit),
    );
  }

  Widget deleteButton() {
    return IconButton(
      onPressed: () async {
        await NoteDatabase.instance.delete(widget.noteId);
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.delete),
    );
  }
}
