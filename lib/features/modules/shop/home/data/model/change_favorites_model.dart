class ChangeFavoriteModel {
  final bool status;
  final String message;
  final ChangeFavoriteDataModel? data;

  ChangeFavoriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoriteModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? ChangeFavoriteDataModel.fromJson(json['data']) : null,
    );
  }
}

class ChangeFavoriteDataModel {
  final int id;
  final ChangeFavoriteProductModel product;

  ChangeFavoriteDataModel({
    required this.id,
    required this.product,
  });

  factory ChangeFavoriteDataModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoriteDataModel(
      id: json['id'],
      product: ChangeFavoriteProductModel.fromJson(json['product']),
    );
  }
}

class ChangeFavoriteProductModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;

  ChangeFavoriteProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ChangeFavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoriteProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
