import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Core/widgets/custom_fading.dart';
import 'package:noteapp/Data/sqflite.dart';
import 'package:noteapp/Screens/widgets/custom_note_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Sqflite sqflite = Sqflite.getInstance();
  List<Map> readdata = [];
  bool isloading = false;
  Color getRandomColor() {
    final Random random = Random();
    int minColorValue = 100;
    return Color.fromARGB(
      255, // Alpha (opacity)
      minColorValue + random.nextInt(256 - minColorValue), // Red (0-255)
      minColorValue + random.nextInt(256 - minColorValue), // Green (0-255)
      minColorValue + random.nextInt(256 - minColorValue), // Blue (0-255)
    );
  }

  void readData() async {
    isloading = true;
    readdata = await sqflite.readdata();
    isloading = false;
    setState(() {});
    print(readdata);
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return readdata.isNotEmpty
        ? isloading
            ? ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => CustomFadingWidget(
                        child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: getRandomColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Container(
                          width: 10,
                          height: 5,
                          decoration: BoxDecoration(
                            color: MyColors.textColor,
                          ),
                        ),
                        subtitle: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: MyColors.textColor,
                          ),
                        ),
                      ),
                    )))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(readdata[index]["id"].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      sqflite.deletedata(readdata[index]["id"]);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: getRandomColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: CustomNoteItem(
                      date: readdata[index]["created_at"],
                      color: getRandomColor(),
                      id: readdata[index]["id"],
                      title: readdata[index]["title"],
                      content: readdata[index]["content"],
                    ),
                  );
                },
                itemCount: readdata.length,
              )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Images/rafiki.png"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create your first note !",
                style: TextStyle(
                    color: MyColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              )
            ],
          );
  }
}
