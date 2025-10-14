import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';
import '../colors.dart';

class AddEditNoteScreen extends ConsumerStatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  ConsumerState<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends ConsumerState<AddEditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Note cannot be empty'),
          backgroundColor: cardColor,
        ),
      );
      return;
    }

    final notifier = ref.read(notesProvider.notifier);

    if (widget.note == null) {
      await notifier.addNote(title, content);
    } else {
      await notifier.updateNote(widget.note!.id, title, content);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 35, 44),
      appBar: AppBar(
        backgroundColor: cardColor,
        iconTheme: IconThemeData(color: white),
        title: Text(
          widget.note == null ? 'New Note' : 'Edit Note',
          style: TextStyle(color: white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: white),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: white,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: white.withAlpha(100)),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  hintText: 'Note',
                  hintStyle: TextStyle(color: white.withAlpha(100)),
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
