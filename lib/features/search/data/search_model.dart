import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

class SearchModel {
  SearchModel({
    bool? status,
    dynamic message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  SearchModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  dynamic _message;
  Data? _data;

  bool? get status => _status;
  dynamic get message => _message;
  Data? get data => _data;
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

class Data {
  Data({
    num? currentPage,
    List<DataList>? datalist,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) {
    _currentPage = currentPage;
    _data = datalist;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataList.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<DataList>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;

  num? get currentPage => _currentPage;
  List<DataList>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;
}

DataList datalistFromJson(String str) => DataList.fromJson(json.decode(str));

class DataList {
  DataList({
    num? id,
    num? price,
    String? image,
    String? name,
    String? description,
    List<String>? images,
    bool? inFavorites,
    bool? inCart,
  }) {
    _id = id;
    _price = price;
    _image = image;
    _name = name;
    _description = description;
    _images = images;
    _inFavorites = inFavorites;
    _inCart = inCart;
  }

  DataList.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _image = json['image'];
    _name = json['name'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _inFavorites = json['in_favorites'];
    _inCart = json['in_cart'];
  }
  num? _id;
  num? _price;
  String? _image;
  String? _name;
  String? _description;
  List<String>? _images;
  bool? _inFavorites;
  bool? _inCart;

  num? get id => _id;
  num? get price => _price;
  String? get image => _image;
  String? get name => _name;
  String? get description => _description;
  List<String>? get images => _images;
  bool? get inFavorites => _inFavorites;
  bool? get inCart => _inCart;
}
