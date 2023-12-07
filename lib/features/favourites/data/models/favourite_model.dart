import 'dart:convert';
FavouriteModel favouriteModelFromJson(String str) => FavouriteModel.fromJson(json.decode(str));
String favouriteModelToJson(FavouriteModel data) => json.encode(data.toJson());
class FavouriteModel {
  FavouriteModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FavouriteModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      Product? product,}){
    _id = id;
    _product = product;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  Product? _product;

  num? get id => _id;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      num? id, 
      num? price, 
      num? oldPrice, 
      num? discount, 
      String? image,}){
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _oldPrice = json['old_price'];
    _discount = json['discount'];
    _image = json['image'];
  }
  num? _id;
  num? _price;
  num? _oldPrice;
  num? _discount;
  String? _image;

  num? get id => _id;
  num? get price => _price;
  num? get oldPrice => _oldPrice;
  num? get discount => _discount;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    map['discount'] = _discount;
    map['image'] = _image;
    return map;
  }

}