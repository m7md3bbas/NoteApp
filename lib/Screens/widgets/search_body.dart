import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Data/sqflite.dart';
import 'package:noteapp/Screens/edit_note_screen.dart';
import 'package:noteapp/Screens/widgets/custom_loading_item.dart';

class SearchBody extends StatelessWidget {
  SearchBody({super.key, required this.query});
  final String query;
  Sqflite sqflite = Sqflite.getInstance();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<Map>>(
        stream: sqflite.searchdata(query), // Use the query passed to the widget
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.hasError) {
            return Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: MyColors.getRandomColor()),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
              "No data found",
              style: TextStyle(color: MyColors.getRandomColor()),
            ));
          }
          if (snapshot.hasData) {
            return query.isEmpty
                ? Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 18,
                        color: MyColors.getRandomColor().withOpacity(0.6),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var note = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(
                                id: note['id'],
                                titleController:
                                    TextEditingController(text: note['title']),
                                contentController: TextEditingController(
                                    text: note['content']),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: MyColors.getRandomColor(),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(
                              note['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              note['content'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              note['created_at'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
          return Container();
        },
      ),
    );
  }
}
