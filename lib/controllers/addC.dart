import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddC extends GetxController {
  late TextEditingController kegiatanC;
  late TextEditingController jamC;
  late TextEditingController noteC;

  @override
  void onInit() {
    super.onInit();
    kegiatanC = TextEditingController();
    jamC = TextEditingController();
    noteC = TextEditingController();
  }

  @override
  void onClose() {
    kegiatanC.dispose();
    jamC.dispose();
    noteC.dispose();
    super.onClose();
  }
}
