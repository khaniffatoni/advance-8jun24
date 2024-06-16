import 'package:flutter/material.dart';
import 'package:flutter_application_advance/provider/product_provider.dart';
import 'package:provider/provider.dart';

class FormProductPage extends StatelessWidget {
  final int idProduct;
  const FormProductPage(this.idProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
        title:
            Text(idProduct == 0 ? 'Form Insert Product' : 'Form Edit Product'),
        actions: [
          TextButton(
              onPressed: () => idProduct == 0
                  ? context.read<ProductProvider>().insertNewProduct(context)
                  : context
                      .read<ProductProvider>()
                      .updateProduct(context, idProduct),
              child: Text(idProduct == 0 ? 'Submit' : 'Update'))
        ],
      ),
      body: Form(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
              controller: provider.nameProductField,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == '') {
                  return 'Isi field ini';
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: 'Insert Name Product',
                  labelText: 'Name Product',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
              controller: provider.qtyProductField,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == '') {
                  return 'Isi field ini';
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: 'Insert Qty Product',
                  labelText: 'Qty Product',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
              controller: provider.descProductField,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              validator: (value) {
                if (value == '') {
                  return 'Isi field ini';
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: 'Insert Description your Product',
                  labelText: 'Description Product',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  ))),
            ),
          ),
        ],
      )),
    );
  }
}
