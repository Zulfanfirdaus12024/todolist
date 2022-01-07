import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../controllers/usersC.dart';
import '../controllers/profileC.dart';

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileC>();
  final userC = Get.find<UsersC>();
  final String uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(uid);
    profileC.kegiatanC.text = user.kegiatan!;
    profileC.jamC.text = user.jam!;
    profileC.noteC.text = user.note!;

    return Scaffold(
      appBar: AppBar(
        title: Text("KEGIATAN"),
        actions: [
          IconButton(
            onPressed: () => userC.delete(uid).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: profileC.kegiatanC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: profileC.jamC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: profileC.noteC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => userC.edit(
                  uid,
                  profileC.kegiatanC.text,
                  profileC.jamC.text,
                  profileC.noteC.text,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => userC.edit(
                  uid,
                  profileC.kegiatanC.text,
                  profileC.jamC.text,
                  profileC.noteC.text,
                ),
                child: Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
