import 'dart:convert';
import '../routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeatController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php? l=English%20Premier%20League'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Process the data as needed
      } else {
        Get.snackbar(
          'Error',
          'Failed to fetch data: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}