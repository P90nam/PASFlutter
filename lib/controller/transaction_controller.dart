import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TransactionController extends GetxController {
  late String nama;
  late String deskripsi;
  late String harga;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      nama = arguments['nama'] ?? '';
      deskripsi = arguments['deskripsi'] ?? '';
      harga = arguments['harga'] ?? '';
    } else {
      nama = '';
      deskripsi = '';
      harga = '';
    }

    void buyProduct() {
      Get.snackbar(
        'Purchase Successful',
        'You have purchased $nama for \$${double.parse(harga).toStringAsFixed(2)}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
    
