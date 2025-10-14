import 'package:hive/hive.dart';
import '../models/note.dart';
import '../services/hive_service.dart';

class NotesRepository {
  final Box<Note> _notesBox = HiveService.getNotesBox();

  List<Note> getAllNotes() {
    return _notesBox.values.toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  Future<void> addNote(Note note) async {
    await _notesBox.put(note.id, note);
  }

  Future<void> updateNote(Note note) async {
    note.updatedAt = DateTime.now();
    await note.save();
  }

  Future<void> deleteNote(String id) async {
    await _notesBox.delete(id);
  }

  Note? getNoteById(String id) {
    return _notesBox.get(id);
  }

  Stream<List<Note>> watchNotes() {
    return _notesBox.watch().map((_) => getAllNotes());
  }
}