class MenuItem {
  MenuItem({
    required this.state,
    required this.msg,
    required this.categories,
    required this.products,
  });

  final String? state;
  final String? msg;
  final List<Category> categories;
  final List<Product> products;

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      state: json["state"],
      msg: json["msg"],
      categories: json["data"]["category"] == null
          ? []
          : List<Category>.from(
              json["data"]["category"].map((x) => Category.fromJson(x))),
      products: json["data"]["product"] == null
          ? []
          : List<Product>.from(
              json["data"]["product"].map((x) => Product.fromJson(x))),
    );
  }
}

class Category {
  Category({
    required this.storeId,
    required this.storeCategoryId,
    required this.categoryName,
    required this.parentId,
    required this.categoryImage,
    required this.rectangularCatImage,
  });

  final int? storeId;
  final int? storeCategoryId;
  final String? categoryName;
  final int? parentId;
  final String? categoryImage;
  final String? rectangularCatImage;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      storeId: json["store_id"],
      storeCategoryId: json["store_category_id"],
      categoryName: json["category_name"],
      parentId: json["parent_id"],
      categoryImage: json["category_image"],
      rectangularCatImage: json["rectangular_cat_image"],
    );
  }
}

class Product {
  Product({
    required this.storeId,
    required this.id,
    required this.productOrder,
    required this.taxId,
    required this.productTypeId,
    required this.productName,
    required this.sku,
    required this.originalProductPrice,
    required this.inflatedProductPrice,
    required this.productPrice,
    required this.convenienceFee,
    required this.productDprice,
    required this.productDesc,
    required this.serviceTaxAmount,
    required this.salesTaxAmount,
    required this.modifierGroup,
    required this.weekdays,
    required this.time,
    required this.crossellProducts,
    required this.productImage,
    required this.cid,
  });

  final String? storeId;
  final String? id;
  final String? productOrder;
  final int? taxId;
  final int? productTypeId;
  final String? productName;
  final String? sku;
  final String? originalProductPrice;
  final String? inflatedProductPrice;
  final String? productPrice;
  final String? convenienceFee;
  final String? productDprice;
  final String? productDesc;
  final String? serviceTaxAmount;
  final String? salesTaxAmount;
  final List<int> modifierGroup;
  final List<dynamic> weekdays;
  final List<dynamic> time;
  final List<int> crossellProducts;
  final dynamic productImage;
  final int? cid;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      storeId: json["store_id"],
      id: json["id"],
      productOrder: json["product_order"],
      taxId: json["tax_id"],
      productTypeId: json["product_type_id"],
      productName: json["product_name"],
      sku: json["sku"],
      originalProductPrice: json["original_product_price"],
      inflatedProductPrice: json["inflated_product_price"],
      productPrice: json["product_price"],
      convenienceFee: json["convenience_fee"],
      productDprice: json["product_dprice"],
      productDesc: json["product_desc"],
      serviceTaxAmount: json["service_tax_amount"],
      salesTaxAmount: json["sales_tax_amount"],
      modifierGroup: json["modifier_group"] == null
          ? []
          : List<int>.from(json["modifier_group"]!.map((x) => x)),
      weekdays: json["weekdays"] == null
          ? []
          : List<dynamic>.from(json["weekdays"]!.map((x) => x)),
      time: json["time"] == null
          ? []
          : List<dynamic>.from(json["time"]!.map((x) => x)),
      crossellProducts: json["crossell_products"] == null
          ? []
          : List<int>.from(json["crossell_products"]!.map((x) => x)),
      productImage: json["product_image"],
      cid: json["cid"],
    );
  }
}

class CrossSellProduct {
  CrossSellProduct({
    required this.productId,
  });

  final int? productId;

  factory CrossSellProduct.fromJson(Map<String, dynamic> json) {
    return CrossSellProduct(
      productId: json["product_id"],
    );
  }
}

class ModifierGroup {
  ModifierGroup({
    required this.storeId,
    required this.gId,
    required this.gSelectType,
    required this.gSelectOption,
    required this.gRequired,
    required this.gMinSelection,
    required this.gMaxSelection,
    required this.gName,
    required this.gOrder,
    required this.modifier,
  });

  final int? storeId;
  final int? gId;
  final String? gSelectType;
  final int? gSelectOption;
  final String? gRequired;
  final int? gMinSelection;
  final int? gMaxSelection;
  final String? gName;
  final String? gOrder;
  final Map<String, Modifier> modifier;

  factory ModifierGroup.fromJson(Map<String, dynamic> json) {
    return ModifierGroup(
      storeId: json["store_id"],
      gId: json["g_id"],
      gSelectType: json["g_select_type"],
      gSelectOption: json["g_select_option"],
      gRequired: json["g_required"],
      gMinSelection: json["g_min_selection"],
      gMaxSelection: json["g_max_selection"],
      gName: json["g_name"],
      gOrder: json["g_order"],
      modifier: Map.from(json["modifier"])
          .map((k, v) => MapEntry<String, Modifier>(k, Modifier.fromJson(v))),
    );
  }
}

class Modifier {
  Modifier({
    required this.modifierGroupId,
    required this.mId,
    required this.mName,
    required this.mPrice,
    required this.mTax,
    required this.mServiceTax,
    required this.mOrder,
  });

  final int? modifierGroupId;
  final int? mId;
  final String? mName;
  final dynamic? mPrice;
  final String? mTax;
  final String? mServiceTax;
  final String? mOrder;

  factory Modifier.fromJson(Map<String, dynamic> json) {
    return Modifier(
      modifierGroupId: json["modifier_group_id"],
      mId: json["m_id"],
      mName: json["m_name"],
      mPrice: json["m_price"],
      mTax: json["m_tax"],
      mServiceTax: json["m_service_tax"],
      mOrder: json["m_order"],
    );
  }
}

class Store {
  Store({
    required this.storeId,
    required this.storeGroupId,
    required this.uid,
    required this.storeName,
    required this.storeSlug,
  });

  final String? storeId;
  final String? storeGroupId;
  final String? uid;
  final String? storeName;
  final String? storeSlug;

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeId: json["store_id"],
      storeGroupId: json["store_group_id"],
      uid: json["uid"],
      storeName: json["store_name"],
      storeSlug: json["store_slug"],
    );
  }
}
