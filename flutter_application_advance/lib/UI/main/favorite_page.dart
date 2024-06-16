import 'package:flutter/material.dart';
import 'package:flutter_application_advance/commons/constant.dart';
import 'package:flutter_application_advance/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../product/form_product_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainProvider>();
    return bodyProductFavorite(provider);
  }

  Widget bodyProductFavorite(MainProvider provider) {
    switch (provider.stateDataProduct) {
      case StateProduct.initial:
        return const SizedBox();
      case StateProduct.loading:
        return const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(), Text('Wait Please')],
          ),
        );
      case StateProduct.noData:
        return Center(
          child: Text(provider.messageError),
        );
      case StateProduct.error:
        return Center(
          child: Text(
            provider.messageError,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        );
      case StateProduct.success:
        return ListView.builder(
          itemCount: provider.listProduct.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.listProduct[index].nameProduct ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      provider.listProduct[index].descProduct ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => context
                                .read<MainProvider>()
                                .moveToDetail(context,
                                    provider.listProduct[index].id ?? 0),
                            icon: Column(
                              children: [
                                Icon(Icons.info, color: Colors.blue),
                                Text('View')
                              ],
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<ProductProvider>().initialData(
                                  provider.listProduct[index].id ?? 0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormProductPage(
                                        provider.listProduct[index].id ?? 0),
                                  ));
                            },
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                Text('Edit')
                              ],
                            )),
                        IconButton(
                            onPressed: () => context
                                .read<MainProvider>()
                                .deleteProduct(context,
                                    provider.listProduct[index].id ?? 0),
                            icon: Column(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                Text('Delete')
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      default:
        return const SizedBox();
    }
  }
}
