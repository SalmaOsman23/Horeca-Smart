
class ProductDataModel {
  List<ProductData>? data;
  Meta? meta;

  ProductDataModel({this.data, this.meta});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : (json["data"] as List).map((e) => ProductData.fromJson(e)).toList();
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    return _data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(pagination != null) {
      _data["pagination"] = pagination?.toJson();
    }
    return _data;
  }
}

class Pagination {
  int? start;
  int? limit;
  int? total;

  Pagination({this.start, this.limit, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    limit = json["limit"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["limit"] = limit;
    _data["total"] = total;
    return _data;
  }
}

class ProductData {
  String? productId;
  String? upc;
  String? productPageUri;
  List<dynamic>? aisleLocations;
  String? brand;
  List<String>? categories;
  String? countryOrigin;
  String? description;
  List<Images>? images;
  List<Items>? items;
  ItemInformation? itemInformation;
  Temperature? temperature;

  ProductData({this.productId, this.upc, this.productPageUri, this.aisleLocations, this.brand, this.categories, this.countryOrigin, this.description, this.images, this.items, this.itemInformation, this.temperature});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    upc = json["upc"];
    productPageUri = json["productPageURI"];
    aisleLocations = json["aisleLocations"] ?? [];
    brand = json["brand"];
    categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    countryOrigin = json["countryOrigin"];
    description = json["description"];
    images = json["images"] == null ? null : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    itemInformation = json["itemInformation"] == null ? null : ItemInformation.fromJson(json["itemInformation"]);
    temperature = json["temperature"] == null ? null : Temperature.fromJson(json["temperature"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["productId"] = productId;
    _data["upc"] = upc;
    _data["productPageURI"] = productPageUri;
    if(aisleLocations != null) {
      _data["aisleLocations"] = aisleLocations;
    }
    _data["brand"] = brand;
    if(categories != null) {
      _data["categories"] = categories;
    }
    _data["countryOrigin"] = countryOrigin;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if(itemInformation != null) {
      _data["itemInformation"] = itemInformation?.toJson();
    }
    if(temperature != null) {
      _data["temperature"] = temperature?.toJson();
    }
    return _data;
  }
}

class Temperature {
  String? indicator;
  bool? heatSensitive;

  Temperature({this.indicator, this.heatSensitive});

  Temperature.fromJson(Map<String, dynamic> json) {
    indicator = json["indicator"];
    heatSensitive = json["heatSensitive"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["indicator"] = indicator;
    _data["heatSensitive"] = heatSensitive;
    return _data;
  }
}

class ItemInformation {
  ItemInformation();

  ItemInformation.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}

class Items {
  String? itemId;
  bool? favorite;
  Fulfillment? fulfillment;
  String? size;

  Items({this.itemId, this.favorite, this.fulfillment, this.size});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json["itemId"];
    favorite = json["favorite"];
    fulfillment = json["fulfillment"] == null ? null : Fulfillment.fromJson(json["fulfillment"]);
    size = json["size"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["itemId"] = itemId;
    _data["favorite"] = favorite;
    if(fulfillment != null) {
      _data["fulfillment"] = fulfillment?.toJson();
    }
    _data["size"] = size;
    return _data;
  }
}

class Fulfillment {
  bool? curbside;
  bool? delivery;
  bool? inStore;
  bool? shipToHome;

  Fulfillment({this.curbside, this.delivery, this.inStore, this.shipToHome});

  Fulfillment.fromJson(Map<String, dynamic> json) {
    curbside = json["curbside"];
    delivery = json["delivery"];
    inStore = json["inStore"];
    shipToHome = json["shipToHome"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["curbside"] = curbside;
    _data["delivery"] = delivery;
    _data["inStore"] = inStore;
    _data["shipToHome"] = shipToHome;
    return _data;
  }
}

class Images {
  String? perspective;
  bool? featured;
  List<Sizes>? sizes;

  Images({this.perspective, this.featured, this.sizes});

  Images.fromJson(Map<String, dynamic> json) {
    perspective = json["perspective"];
    featured = json["featured"];
    sizes = json["sizes"] == null ? null : (json["sizes"] as List).map((e) => Sizes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["perspective"] = perspective;
    _data["featured"] = featured;
    if(sizes != null) {
      _data["sizes"] = sizes?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Sizes {
  String? size;
  String? url;

  Sizes({this.size, this.url});

  Sizes.fromJson(Map<String, dynamic> json) {
    size = json["size"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["size"] = size;
    _data["url"] = url;
    return _data;
  }
}