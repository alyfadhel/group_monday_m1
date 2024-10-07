class FavoritesModel {
  final bool status;
  final FavoritesDataModel? data;

  FavoritesModel({
    required this.status,
    required this.data,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      data: json['data'] != null ? FavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class FavoritesDataModel {
  final int currentPage;
  final List<FavoritesDetailsDataModel> data;

  FavoritesDataModel({
    required this.currentPage,
    required this.data,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    List<FavoritesDetailsDataModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach(
        (element) {
          data.add(FavoritesDetailsDataModel.fromJson(element));
        },
      );
    }
    return FavoritesDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class FavoritesDetailsDataModel {
  final int id;
  final FavoritesDetailsProductModel product;

  FavoritesDetailsDataModel({
    required this.id,
    required this.product,
  });

  factory FavoritesDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDetailsDataModel(
      id: json['id'],
      product: FavoritesDetailsProductModel.fromJson(json['product']),
    );
  }
}

class FavoritesDetailsProductModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  FavoritesDetailsProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavoritesDetailsProductModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDetailsProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
