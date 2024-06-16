import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name Product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(provider.detailProduct.nameProduct ?? '')
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description Product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(provider.detailProduct.descProduct ?? '')
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qty Product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(provider.detailProduct.qty.toString())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
