import 'package:hive_flutter/hive_flutter.dart';
import '../models/note.dart';

class HiveService {
  static const String notesBoxName = 'notes';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    await Hive.openBox<Note>(notesBoxName);
  }

  static Box<Note> getNotesBox() {
    return Hive.box<Note>(notesBoxName);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}