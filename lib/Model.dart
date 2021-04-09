class Products {
  List<Data> _data;
  int _code;
  String _message;
  String _imageUrl;

  Products({List<Data> data, int code, String message, String imageUrl}) {
    this._data = data;
    this._code = code;
    this._message = message;
    this._imageUrl = imageUrl;
  }

  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  int get code => _code;
  set code(int code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _code = json['code'];
    _message = json['message'];
    _imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    data['message'] = this._message;
    data['image_url'] = this._imageUrl;
    return data;
  }
}

class Data {
  int _id;
  int _unitId;
  String _code;
  String _name;
  String _featuredImage;
  String _price;
  String _weight;
  String _description;
  int _isFeatured;
  int _customizeBox;
  int _status;
  int _createdBy;
  int _updatedBy;
  Null _deletedAt;
  String _createdAt;
  String _updatedAt;
  List<CategoryProduct> _categoryProduct;

  Data(
      {int id,
        int unitId,
        String code,
        String name,
        String featuredImage,
        String price,
        String weight,
        String description,
        int isFeatured,
        int customizeBox,
        int status,
        int createdBy,
        int updatedBy,
        Null deletedAt,
        String createdAt,
        String updatedAt,
        List<CategoryProduct> categoryProduct}) {
    this._id = id;
    this._unitId = unitId;
    this._code = code;
    this._name = name;
    this._featuredImage = featuredImage;
    this._price = price;
    this._weight = weight;
    this._description = description;
    this._isFeatured = isFeatured;
    this._customizeBox = customizeBox;
    this._status = status;
    this._createdBy = createdBy;
    this._updatedBy = updatedBy;
    this._deletedAt = deletedAt;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._categoryProduct = categoryProduct;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get unitId => _unitId;
  set unitId(int unitId) => _unitId = unitId;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  String get featuredImage => _featuredImage;
  set featuredImage(String featuredImage) => _featuredImage = featuredImage;
  String get price => _price;
  set price(String price) => _price = price;
  String get weight => _weight;
  set weight(String weight) => _weight = weight;
  String get description => _description;
  set description(String description) => _description = description;
  int get isFeatured => _isFeatured;
  set isFeatured(int isFeatured) => _isFeatured = isFeatured;
  int get customizeBox => _customizeBox;
  set customizeBox(int customizeBox) => _customizeBox = customizeBox;
  int get status => _status;
  set status(int status) => _status = status;
  int get createdBy => _createdBy;
  set createdBy(int createdBy) => _createdBy = createdBy;
  int get updatedBy => _updatedBy;
  set updatedBy(int updatedBy) => _updatedBy = updatedBy;
  Null get deletedAt => _deletedAt;
  set deletedAt(Null deletedAt) => _deletedAt = deletedAt;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  List<CategoryProduct> get categoryProduct => _categoryProduct;
  set categoryProduct(List<CategoryProduct> categoryProduct) =>
      _categoryProduct = categoryProduct;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _unitId = json['unit_id'];
    _code = json['code'];
    _name = json['name'];
    _featuredImage = json['featured_image'];
    _price = json['price'];
    _weight = json['weight'];
    _description = json['description'];
    _isFeatured = json['is_featured'];
    _customizeBox = json['customize_box'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['category_product'] != null) {
      _categoryProduct = new List<CategoryProduct>();
      json['category_product'].forEach((v) {
        _categoryProduct.add(new CategoryProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['unit_id'] = this._unitId;
    data['code'] = this._code;
    data['name'] = this._name;
    data['featured_image'] = this._featuredImage;
    data['price'] = this._price;
    data['weight'] = this._weight;
    data['description'] = this._description;
    data['is_featured'] = this._isFeatured;
    data['customize_box'] = this._customizeBox;
    data['status'] = this._status;
    data['created_by'] = this._createdBy;
    data['updated_by'] = this._updatedBy;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._categoryProduct != null) {
      data['category_product'] =
          this._categoryProduct.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryProduct {
  int _id;
  int _categoryId;
  int _productId;
  String _createdAt;
  String _updatedAt;

  CategoryProduct(
      {int id,
        int categoryId,
        int productId,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._categoryId = categoryId;
    this._productId = productId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get categoryId => _categoryId;
  set categoryId(int categoryId) => _categoryId = categoryId;
  int get productId => _productId;
  set productId(int productId) => _productId = productId;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category_id'] = this._categoryId;
    data['product_id'] = this._productId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
