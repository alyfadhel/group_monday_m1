class ProductsDetailsModel {
  final bool status;
  final ProductsDetailsDataModel? data;

  ProductsDetailsModel({
    required this.status,
    required this.data,
  });

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductsDetailsModel(
      status: json['status'],
      data: json['data'] != null ? ProductsDetailsDataModel.fromJson(json['data']) : null,
    );
  }
}

class ProductsDetailsDataModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductsDetailsDataModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductsDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductsDetailsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
