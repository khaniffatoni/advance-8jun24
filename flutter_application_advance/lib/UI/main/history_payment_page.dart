import 'package:flutter/material.dart';

import '../../commons/constant.dart';

class HistoryPaymentPage extends StatelessWidget {
  const HistoryPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listOrder[index].idTransaction,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(listOrder[index].product),
                Text(listOrder[index].qty.toString()),
                Text(listOrder[index].statusTransaction)
              ],
            ),
          ),
        );
      },
    );
  }
}
