import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Core/widgets/custom_fading.dart';
import 'package:noteapp/Data/sqflite.dart';
import 'package:noteapp/Screens/widgets/custom_loading_item.dart';
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
            ? CustomLoadingItems()
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
                        color: MyColors.getRandomColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: CustomNoteItem(
                      date: readdata[index]["created_at"],
                      color: MyColors.getRandomColor(),
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
