class DetailProductResponse {
  Data? data;
  bool? error;
  String? message;

  DetailProductResponse({this.data, this.error, this.message});

  DetailProductResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? nameProduct;
  int? qty;
  String? descProduct;

  Data({this.id, this.nameProduct, this.qty, this.descProduct});

  Data.fromJson(Map<String, dynamic> json) {
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