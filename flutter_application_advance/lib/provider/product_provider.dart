import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_advance/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../models/detail_product_response.dart';

class ProductProvider extends ChangeNotifier {
  TextEditingController nameProductField = TextEditingController();
  TextEditingController qtyProductField = TextEditingController();
  TextEditingController descProductField = TextEditingController();

  void initialData(int id) async {
    if (id == 0) {
      nameProductField.text = '';
      qtyProductField.text = '0';
      descProductField.text = '';
    } else {
      Response response = await Dio().get('http://10.0.2.2:8080/product/$id');
      var result = DetailProductResponse.fromJson(response.data);
      var detailProduct = result.data!;
      nameProductField.text = detailProduct.nameProduct ?? '';
      qtyProductField.text = (detailProduct.qty ?? 0).toString();
      descProductField.text = detailProduct.descProduct ?? '';
    }
    notifyListeners();
  }

  void insertNewProduct(BuildContext context) async {
    try {
      Response response =
          await Dio().post('http://10.0.2.2:8080/product', data: {
        "name_product": nameProductField.text,
        "qty": int.parse(qtyProductField.text),
        "desc_product": descProductField.text
      });
      var result = DetailProductResponse.fromJson(response.data);

      if (result.data!.id == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error : ${result.message}')));
      } else {
        Navigator.pop(context);
        context.read<MainProvider>().getListProduct();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : ${e.toString()}')));
    }
    ;
    notifyListeners();
  }

  void updateProduct(BuildContext context, int id) async {
    try {
      Response response =
          await Dio().put('http://10.0.2.2:8080/product', data: {
        "id": id,
        "name_product": nameProductField.text,
        "qty": int.parse(qtyProductField.text),
        "desc_product": descProductField.text
      });
      var result = DetailProductResponse.fromJson(response.data);

      if (result.data!.id == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error : ${result.message}')));
      } else {
        Navigator.pop(context);
        context.read<MainProvider>().getListProduct();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : ${e.toString()}')));
    }
    ;
    notifyListeners();
  }
}
