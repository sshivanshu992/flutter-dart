import 'package:flutter/material.dart';
import 'package:note_app/db/database.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/widgets/form.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;
  const AddEditNotePage({Key? key, this.note}) : super(key: key);

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;
  late bool isImportant;
  late int priorityLevel;

  @override
  initState() {
    super.initState();
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    isImportant = widget.note?.isImportant ?? false;
    priorityLevel = widget.note?.priorityLevel ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [saveButton()],
      ),
      body: Form(
        key: _formKey,
        child: NoteFormWidget(
          title: title,
          description: description,
          isImportant: isImportant,
          priorityLevel: priorityLevel,
          onChangedImportant: (isImportant) =>
              setState(() => this.isImportant = isImportant),
          onChangedPriorityLevel: (priorityLevel) =>
              setState(() => this.priorityLevel = priorityLevel),
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => 
              setState(() => this.description = description),
        ),
      ),
    );
  }

  Widget saveButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => addOrUpdateNote(),
        child: Icon(
          Icons.save,
          color: isFormValid ? Colors.blue : Colors.grey.shade900,
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.note != null;
      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
    }
    Navigator.of(context).pop();
  }

  Future updateNote() async {
    final note = widget.note!.copy(
        title: title,
        description: description,
        isImportant: isImportant,
        priorityLevel: priorityLevel);
    await NoteDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
        title: title,
        description: description,
        isImportant: isImportant,
        priorityLevel: priorityLevel,
        createdTime: DateTime.now());
    await NoteDatabase.instance.create(note);
  }
}
