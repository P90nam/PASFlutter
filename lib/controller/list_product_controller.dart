import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/makanan_model.dart';

class ListProductController extends GetxController {
  var isLoading = true.obs;
  final RxList<MakananModel> makananList = <MakananModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMakanan();
  }


  void fetchMakanan() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final fetchedMakanan = Makanan();
      makananList.assignAll(fetchedMakanan);
    } finally {
      isLoading(false);
    }
  }
}

  


List<MakananModel> Makanan() {
    return [
      MakananModel(
        nama: 'Nasi Goreng Spesial',
        harga: "25000",
        deskripsi: 'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
      ),
      MakananModel(
        nama: 'Mie Ayam Bakso',
        harga: "20000",
        deskripsi: 'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
      ),
      MakananModel(
        nama: 'Sate Ayam Madura',
        harga: "28000",
        deskripsi: '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
      ),
      MakananModel(
        nama: 'Ayam Bakar Madu',
        harga: "30000",
        deskripsi: 'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
      ),
      MakananModel(
        nama: 'Es Teh Jumbo Manis',
        harga: "8000",
        deskripsi: 'Minuman teh melati segar dengan gula asli dan es batu kristal.',
      ),
    ];
  }