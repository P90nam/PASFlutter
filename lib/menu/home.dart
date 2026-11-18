import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/list_product_controller.dart';
import '../controller/transaction_controller.dart';

import '../routes.dart';



class HomePage extends StatelessWidget {
  final ListProductController listProductController = Get.put(ListProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: listProductController.makananList.length,
        itemBuilder: (context, index) {
          final product = listProductController.makananList[index];
          return Card(
            child: ListTile(
              title: Text(product.nama),
              subtitle: Text('Harga: ${product.harga}'),
              onTap: () {
                final transactionController = Get.put(TransactionController());
                transactionController.nama = product.nama;
                transactionController.deskripsi = product.deskripsi;
                transactionController.harga = product.harga;git init

                // Navigate to the TransactionPage
                Get.toNamed(Routes.transaction);
              },
            ),
          );
        },
      ),
    );
  }
}