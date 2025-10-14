import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:brl_task_3/colors.dart';
import 'package:brl_task_3/sideMenuBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/notes_provider.dart';
import 'models/note.dart';
import 'screens/add_edit_note_screen.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerkey,
      drawer: Sidemenu(),
      backgroundColor: const Color.fromARGB(255, 33, 35, 44),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _drawerkey.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu, color: white),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      SizedBox(width: 10),

                      // Search bar - in the middle
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 70, 73, 85),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Search Your Notes',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 127),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  overlayColor: const Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    0.3,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  minimumSize: Size(40, 40),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.grid_view,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      CircleAvatar(radius: 16, backgroundColor: Colors.white),
                    ],
                  ),
                ),
                notesSectionAll(),

                /* Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      height: MediaQuery.of(context).size.height,

                      child: MasonryGridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,

                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? const Color.fromRGBO(27, 94, 32, 1)
                                : Colors.blue[900],
                            border: Border.all(
                              color: Color.fromRGBO(27, 94, 32, 1),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HEADING",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                index.isEven
                                    ? note.length > 250
                                          ? "${note.substring(0, 250)}..."
                                          : note
                                    : note1,
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), */
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 139, 180, 255),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget notesSectionAll() {
    final notes = ref.watch(notesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Text(
                "",
                style: TextStyle(
                  color: white.withAlpha(128),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Direct access to notes list
        notes.isEmpty
            ? Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: Text(
                    'No notes yet!\nTap + to create one',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: white.withAlpha(128)),
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.height,
                child: MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notes.length,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEditNoteScreen(note: note),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 19, 21, 29),
                          border: Border.all(color: white.withAlpha(100)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    note.title.isEmpty
                                        ? "Untitled"
                                        : note.title,
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: white.withAlpha(178),
                                  ),
                                  onPressed: () async {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: cardColor,
                                        title: Text(
                                          'Delete Note',
                                          style: TextStyle(color: white),
                                        ),
                                        content: Text(
                                          'Are you sure you want to delete this note?',
                                          style: TextStyle(
                                            color: white.withAlpha(200),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(color: white),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (confirmed == true) {
                                      ref
                                          .read(notesProvider.notifier)
                                          .deleteNote(note.id);
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              note.content.length > 250
                                  ? "${note.content.substring(0, 250)}..."
                                  : note.content,
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

        SizedBox(height: 250),
      ],
    );
  }
}
