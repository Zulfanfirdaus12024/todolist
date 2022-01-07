import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/addC.dart';
import '../controllers/usersC.dart';

class AddPage extends StatelessWidget {
  final addC = Get.find<AddC>();
  final usersC = Get.find<UsersC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: addC.kegiatanC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Kegiatan",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: addC.jamC,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Jam",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: addC.noteC,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Note",
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => usersC.add(
                  addC.kegiatanC.text,
                  addC.jamC.text,
                  addC.noteC.text,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => usersC.add(
                  addC.kegiatanC.text,
                  addC.jamC.text,
                  addC.noteC.text,
                ),
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
