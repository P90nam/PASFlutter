import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/transaction_controller.dart';

class TransactionPage extends StatelessWidget {
  final TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('Produk Detail')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 240,
          ),
          const SizedBox(height: 16),
          Text(
            transactionController.nama,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            transactionController.harga,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            transactionController.deskripsi,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}