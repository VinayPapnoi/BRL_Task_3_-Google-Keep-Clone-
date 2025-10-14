import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../repositories/notes_repository.dart';

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return NotesRepository();
});

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  final repository = ref.watch(notesRepositoryProvider);
  return NotesNotifier(repository);
});

class NotesNotifier extends StateNotifier<List<Note>> {
  final NotesRepository _repository;

  NotesNotifier(this._repository) : super([]) {
    _loadNotes();
 
    _repository.watchNotes().listen((notes) {
      state = notes;
    });
  }

  void _loadNotes() {
    state = _repository.getAllNotes();
  }

  Future<void> addNote(String title, String content) async {
    final note = Note(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await _repository.addNote(note);
    _loadNotes();
  }

  Future<void> updateNote(String id, String title, String content) async {
    final note = _repository.getNoteById(id);
    if (note != null) {
      note.title = title;
      note.content = content;
      await _repository.updateNote(note);
      _loadNotes();
    }
  }

  Future<void> deleteNote(String id) async {
    await _repository.deleteNote(id);
    _loadNotes();
  }
}