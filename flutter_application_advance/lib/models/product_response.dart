class ProductResponse {
  List<DataProduct>? data;
  bool? error;
  String? message;

  ProductResponse({this.data, this.error, this.message});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataProduct>[];
      json['data'].forEach((v) {
        data!.add(DataProduct.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class DataProduct {
  int? id;
  String? nameProduct;
  int? qty;
  String? descProduct;

  DataProduct({this.id, this.nameProduct, this.qty, this.descProduct});

  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameProduct = json['name_product'];
    qty = json['qty'];
    descProduct = json['desc_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_product'] = nameProduct;
    data['qty'] = qty;
    data['desc_product'] = descProduct;
    return data;
  }
}