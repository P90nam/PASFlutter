import 'dart:convert';
import '../routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    // Validasi input kosong
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Username dan password harus terisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      final url = Uri.parse('https://mediadwi.com/api/latihan/login'); 
      
      final response = await http.post(
        url,
        body: {
          'username': txtUsername.text,
          'password': txtPassword.text,
        },
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {

          Get.snackbar(
            'Berhasil',
            data['message'] ?? 'Login sukses',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offAllNamed(Routes.home);

        } else {
          Get.snackbar(
            'Gagal',
            data['message'] ?? 'Login gagal',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Server Error: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print('Error: $e');
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}