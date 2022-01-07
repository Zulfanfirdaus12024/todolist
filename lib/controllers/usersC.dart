import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user.dart';

class UsersC extends GetxController {
  var users = List<User>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: Duration(seconds: 2),
    );
  }

  void add(String kegiatan, String jam, String note) {
    if (kegiatan != '' && jam != '' && note != '') {
      if (jam.contains(":")) {
        users.add(
          User(
            id: DateTime.now().toString(),
            kegiatan: kegiatan,
            jam: jam,
            note: note,
          ),
        );
        Get.back();
      } else {
        snackBarError("Masukan jam valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  User userById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  void edit(String id, String kegiatan, String jam, String note) {
    if (kegiatan != '' && jam != '' && note != '') {
      if (jam.contains(":")) {
        final user = userById(id);
        user.kegiatan = kegiatan;
        user.jam = jam;
        user.note = note;
        users.refresh();
        Get.back();
      } else {
        snackBarError("Masukan jam valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> delete(String id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus kegiatan ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        users.removeWhere((element) => element.id == id);
        _deleted = true;
        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }
}
