import 'dart:convert';

class FilterProductResponseModel {
  FilterProductResponseModel({
    required this.totalProduct,
    required this.totalCollection,
    required this.totalPage,
    required this.fromCache,
    required this.products,
    required this.eventType,
    //required this.filter,
    required this.affectedByMerchandising,
  });

  int totalProduct;
  int totalCollection;
  int totalPage;
  bool fromCache;
  List<Product> products;
  dynamic eventType;

  // Filter filter;
  bool affectedByMerchandising;

  factory FilterProductResponseModel.fromRawJson(String str) =>
      FilterProductResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FilterProductResponseModel.fromJson(Map<String, dynamic> json) =>
      FilterProductResponseModel(
        totalProduct: json["total_product"],
        totalCollection: json["total_collection"],
        totalPage: json["total_page"],
        fromCache: json["from_cache"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        eventType: json["event_type"],
        // filter: Filter.fromJson(json["filter"]),
        affectedByMerchandising: json["affected_by_merchandising"],
      );

  Map<String, dynamic> toJson() => {
        "total_product": totalProduct,
        "total_collection": totalCollection,
        "total_page": totalPage,
        "from_cache": fromCache,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "event_type": eventType,
        //"filter": filter.toJson(),
        "affected_by_merchandising": affectedByMerchandising,
      };
}

class Filter {
  Filter({
    required this.options,
  });

  List<Option> options;

  factory Filter.fromRawJson(String str) => Filter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    required this.filterOptionId,
    required this.displayType,
    required this.filterType,
    required this.label,
    required this.position,
    required this.selectType,
    required this.valueType,
    required this.status,
    required this.hideTextBoxes,
    required this.values,
    required this.tooltip,
    required this.showMoreType,
    required this.manualValues,
    required this.removeTextFilterValues,
    required this.replaceTextFilterValues,
    required this.excludedValues,
    required this.isCollapseMobile,
    required this.isCollapsePc,
    required this.displayAllValuesInUppercaseForm,
    required this.showSearchBoxFilterMobile,
    required this.showSearchBoxFilterPc,
    required this.sortManualValues,
    required this.sortType,
    required this.swatchStyle,
    required this.prefix,
  });

  String filterOptionId;
  DisplayType displayType;
  String filterType;
  String label;
  int position;
  SelectType selectType;
  ValueType valueType;
  Status status;
  bool hideTextBoxes;
  dynamic values;
  dynamic tooltip;
  ShowMoreType showMoreType;
  List<dynamic> manualValues;
  String removeTextFilterValues;
  dynamic replaceTextFilterValues;
  List<dynamic> excludedValues;
  bool isCollapseMobile;
  bool isCollapsePc;
  bool displayAllValuesInUppercaseForm;
  bool showSearchBoxFilterMobile;
  bool showSearchBoxFilterPc;
  bool sortManualValues;
  String sortType;
  String swatchStyle;
  String prefix;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        filterOptionId: json["filterOptionId"]??'',
        displayType: json["displayType"],
        filterType: json["filterType"]??'',
        label: json["label"]??'',
        position: json["position"],
        selectType: json["selectType"],
        valueType: json["valueType"],
        status: json["status"],
        hideTextBoxes: json["hideTextBoxes"],
        values: json["values"],
        tooltip: json["tooltip"],
        showMoreType: json["showMoreType"],
        manualValues: List<dynamic>.from(json["manualValues"].map((x) => x)),
        removeTextFilterValues: json["removeTextFilterValues"],
        replaceTextFilterValues: json["replaceTextFilterValues"],
        excludedValues:
            List<dynamic>.from(json["excludedValues"].map((x) => x)),
        isCollapseMobile: json["isCollapseMobile"],
        isCollapsePc: json["isCollapsePC"],
        displayAllValuesInUppercaseForm:
            json["displayAllValuesInUppercaseForm"],
        showSearchBoxFilterMobile: json["showSearchBoxFilterMobile"],
        showSearchBoxFilterPc: json["showSearchBoxFilterPC"],
        sortManualValues: json["sortManualValues"],
        sortType: json["sortType"],
        swatchStyle: json["swatchStyle"],
        prefix: json["prefix"],
      );

  Map<String, dynamic> toJson() => {
        "filterOptionId": filterOptionId,
        "displayType": displayTypeValues.reverse[displayType],
        "filterType": filterType,
        "label": label,
        "position": position,
        "selectType": selectTypeValues.reverse[selectType],
        "valueType": valueTypeValues.reverse[valueType],
        "status": statusValues.reverse[status],
        "hideTextBoxes": hideTextBoxes,
        "values": values,
        "tooltip": tooltip,
        "showMoreType": showMoreTypeValues.reverse[showMoreType],
        "manualValues": List<dynamic>.from(manualValues.map((x) => x)),
        "removeTextFilterValues": removeTextFilterValues,
        "replaceTextFilterValues": replaceTextFilterValues,
        "excludedValues": List<dynamic>.from(excludedValues.map((x) => x)),
        "isCollapseMobile": isCollapseMobile,
        "isCollapsePC": isCollapsePc,
        "displayAllValuesInUppercaseForm": displayAllValuesInUppercaseForm,
        "showSearchBoxFilterMobile": showSearchBoxFilterMobile,
        "showSearchBoxFilterPC": showSearchBoxFilterPc,
        "sortManualValues": sortManualValues,
        "sortType": sortTypeValues.reverse[sortType],
        "swatchStyle": swatchStyleValues.reverse[swatchStyle],
        "prefix": prefix,
      };
}

enum DisplayType { LIST, RANGE, SWATCH }

final displayTypeValues = EnumValues({
  "list": DisplayType.LIST,
  "range": DisplayType.RANGE,
  "swatch": DisplayType.SWATCH
});

class ManualValueElement {
  ManualValueElement({
    required this.key,
    required this.label,
    required this.docCount,
  });

  String key;
  String label;
  int docCount;

  factory ManualValueElement.fromRawJson(String str) =>
      ManualValueElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ManualValueElement.fromJson(Map<String, dynamic> json) =>
      ManualValueElement(
        key: json["key"],
        label: json["label"],
        docCount: json["doc_count"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
        "doc_count": docCount,
      };
}

enum SelectType { MULTIPLE }

final selectTypeValues = EnumValues({"multiple": SelectType.MULTIPLE});

enum ShowMoreType { NONE, SCROLLBAR }

final showMoreTypeValues = EnumValues(
    {"none": ShowMoreType.NONE, "scrollbar": ShowMoreType.SCROLLBAR});

enum SortType { KEY_ASC }

final sortTypeValues = EnumValues({"key-asc": SortType.KEY_ASC});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

enum SwatchStyle { CIRCLE_GRID }

final swatchStyleValues = EnumValues({"circle-grid": SwatchStyle.CIRCLE_GRID});

enum ValueType { ALL, SPECIFIC }

final valueTypeValues =
    EnumValues({"all": ValueType.ALL, "specific": ValueType.SPECIFIC});

class ValuesClass {
  ValuesClass({
    required this.max,
    required this.min,
  });

  int max;
  int min;

  factory ValuesClass.fromRawJson(String str) =>
      ValuesClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValuesClass.fromJson(Map<String, dynamic> json) => ValuesClass(
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}

class Product {
  Product({
    required this.priceMinUsd,
    required this.optionsWithValues,
    required this.skus,
    required this.mergedSearchEngram,
    required this.compareAtPriceMaxUsd,
    required this.handle,
    required this.variants,
    required this.percentSaleMinUsd,
    required this.compareAtPriceMin,
    required this.title,
    required this.priceMin,
    required this.imagesInfo,
    required this.tags,
    required this.compareAtPriceMinUsd,
    required this.priceMaxUsd,
    required this.vendor,
    required this.percentSaleMin,
    required this.locations,
    required this.availableLocations,
    required this.id,
    required this.position,
    required this.productCategory,
    required this.priceMax,
    required this.tsCustomFields,
    this.isCart = false,
  });

  dynamic priceMinUsd;
  List<OptionsWithValue> optionsWithValues;
  List<String> skus;
  String mergedSearchEngram;
  dynamic compareAtPriceMaxUsd;
  String handle;
  List<Variant> variants;
  dynamic percentSaleMinUsd;
  dynamic compareAtPriceMin;
  String title;
  dynamic priceMin;
  List<ImagesInfo> imagesInfo;
  List<String> tags;
  int compareAtPriceMinUsd;
  dynamic priceMaxUsd;
  String vendor;
  int percentSaleMin;
  List<Location> locations;
  List<int> availableLocations;
  int id;
  dynamic position;
  dynamic productCategory;
  dynamic priceMax;
  TsCustomFields tsCustomFields;
  bool isCart;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        priceMinUsd: json["price_min_usd"] ?? 0.0,
        optionsWithValues: List<OptionsWithValue>.from(
            json["options_with_values"]
                .map((x) => OptionsWithValue.fromJson(x))),
        skus: List<String>.from(json["skus"].map((x) => x)),
        mergedSearchEngram: json["merged_search_engram"],
        compareAtPriceMaxUsd: json["compare_at_price_max_usd"] ?? 0,
        handle: json["handle"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        percentSaleMinUsd: json["percent_sale_min_usd"] ?? 0,
        compareAtPriceMin: json["compare_at_price_min"] ?? 0,
        title: json["title"],
        priceMin: json["price_min"] ?? 0.0,
        imagesInfo: List<ImagesInfo>.from(
            json["images_info"].map((x) => ImagesInfo.fromJson(x))),
        tags: List<String>.from(json["tags"].map((x) => x)),
        compareAtPriceMinUsd: json["compare_at_price_min_usd"] ?? 0,
        priceMaxUsd: json["price_max_usd"] ?? 0,
        vendor: json["vendor"],
        percentSaleMin: json["percent_sale_min"] ?? 0,
        locations: List<Location>.from(
            json["locations"].map((x) => locationValues.map[x])),
        availableLocations:
            List<int>.from(json["available_locations"].map((x) => x)),
        id: json["id"],
        position: json["position"],
        productCategory: json["product_category"],
        priceMax: json["price_max"] ?? 0.0,
        tsCustomFields: TsCustomFields.fromJson(json["ts_custom_fields"]),
      );

  Map<String, dynamic> toJson() => {
        "price_min_usd": priceMinUsd,
        "options_with_values":
            List<dynamic>.from(optionsWithValues.map((x) => x.toJson())),
        "skus": List<dynamic>.from(skus.map((x) => x)),
        "merged_search_engram": mergedSearchEngram,
        "compare_at_price_max_usd": compareAtPriceMaxUsd,
        "handle": handle,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "percent_sale_min_usd": percentSaleMinUsd,
        "compare_at_price_min": compareAtPriceMin,
        "title": title,
        "price_min": priceMin,
        "images_info": List<dynamic>.from(imagesInfo.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "compare_at_price_min_usd": compareAtPriceMinUsd,
        "price_max_usd": priceMaxUsd,
        "vendor": vendorValues.reverse[vendor],
        "percent_sale_min": percentSaleMin,
        "locations":
            List<dynamic>.from(locations.map((x) => locationValues.reverse[x])),
        "available_locations":
            List<dynamic>.from(availableLocations.map((x) => x)),
        "id": id,
        "position": position,
        "product_category": productCategory,
        "price_max": priceMax,
        "ts_custom_fields": tsCustomFields.toJson(),
      };
}

class ImagesInfo {
  ImagesInfo({
    required this.src,
    required this.width,
    required this.alt,
    required this.id,
    required this.position,
    required this.height,
  });

  String src;
  int width;
  dynamic alt;
  int id;
  int position;
  int height;

  factory ImagesInfo.fromRawJson(String str) =>
      ImagesInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesInfo.fromJson(Map<String, dynamic> json) => ImagesInfo(
        src: json["src"],
        width: json["width"],
        alt: json["alt"],
        id: json["id"],
        position: json["position"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "width": width,
        "alt": alt,
        "id": id,
        "position": position,
        "height": height,
      };
}

enum Location {
  ALL_BAGDHAD_SHOWROOM,
  INSTOCK_BAGDHAD_SHOWROOM,
  OUTSTOCK_BAGDHAD_SHOWROOM
}

final locationValues = EnumValues({
  "all:Bagdhad Showroom": Location.ALL_BAGDHAD_SHOWROOM,
  "instock:Bagdhad Showroom": Location.INSTOCK_BAGDHAD_SHOWROOM,
  "outstock:Bagdhad Showroom": Location.OUTSTOCK_BAGDHAD_SHOWROOM
});

class OptionsWithValue {
  OptionsWithValue({
    required this.values,
    required this.name,
    required this.label,
  });

  List<OptionsWithValueValue> values;
  String name;
  String label;

  factory OptionsWithValue.fromRawJson(String str) =>
      OptionsWithValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OptionsWithValue.fromJson(Map<String, dynamic> json) =>
      OptionsWithValue(
        values: List<OptionsWithValueValue>.from(
            json["values"].map((x) => OptionsWithValueValue.fromJson(x))),
        name: json["name"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "name": nameValues.reverse[name],
        "label": labelValues.reverse[label],
      };
}

enum Label { TITLE }

final labelValues = EnumValues({"Title": Label.TITLE});

enum Name { TITLE }

final nameValues = EnumValues({"title": Name.TITLE});

class OptionsWithValueValue {
  OptionsWithValueValue({
    required this.image,
    required this.title,
  });

  dynamic image;
  String title;

  factory OptionsWithValueValue.fromRawJson(String str) =>
      OptionsWithValueValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OptionsWithValueValue.fromJson(Map<String, dynamic> json) =>
      OptionsWithValueValue(
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": titleValues.reverse[title],
      };
}

enum Title { DEFAULT_TITLE }

final titleValues = EnumValues({"Default Title": Title.DEFAULT_TITLE});

class TsCustomFields {
  TsCustomFields();

  factory TsCustomFields.fromRawJson(String str) =>
      TsCustomFields.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TsCustomFields.fromJson(Map<String, dynamic> json) =>
      TsCustomFields();

  Map<String, dynamic> toJson() => {};
}

class Variant {
  Variant({
    required this.mergedOptions,
    required this.inventoryQuantity,
    required this.priceUsd,
    required this.image,
    //required this.presentmentPrices,
   // required this.inventoryQuantities,
    required this.compareAtPrice,
    required this.inventoryManagement,
    required this.fulfillmentService,
    required this.available,
    required this.weight,
    required this.title,
    required this.inventoryPolicy,
    required this.weightUnit,
    required this.price,
    required this.availableLocations,
    required this.locations,
    required this.id,
    required this.sku,
    required this.barcode,
    required this.compareAtPriceUsd,
  });

  List<MergedOption> mergedOptions;
  int inventoryQuantity;
  String priceUsd;
  dynamic image;
 // List<PresentmentPrice> presentmentPrices;
 // Map<String, int> inventoryQuantities;
  String compareAtPrice;
  String inventoryManagement;
  String fulfillmentService;
  bool available;
  dynamic weight;
  String title;
  String inventoryPolicy;
  String weightUnit;
  String price;
  List<int> availableLocations;
  List<Location> locations;
  int id;
  String sku;
  String barcode;
  String compareAtPriceUsd;

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        mergedOptions: List<MergedOption>.from(
            json["merged_options"].map((x) => mergedOptionValues.map[x])),
        inventoryQuantity: json["inventory_quantity"]??0,
        priceUsd: json["price_usd"]??'',
        image: json["image"],
       // presentmentPrices: List<PresentmentPrice>.from(
         //   json["presentment_prices"]
            //    .map((x) => PresentmentPrice.fromJson(x))??[]),
        //inventoryQuantities: Map.from(json["inventory_quantities"])
        //    .map((k, v) => MapEntry<String, int>(k, v)),
        compareAtPrice: json["compare_at_price"] ?? '',
        inventoryManagement: json["inventory_management"]??'',
        fulfillmentService: json["fulfillment_service"]??'',
        available: json["available"],
        weight: json["weight"] ?? 0.0,
        title: json["title"] ?? '',
        inventoryPolicy: json["inventory_policy"]??'',
        weightUnit: json["weight_unit"]??'',
        price: json["price"]??'',
        availableLocations:
            List<int>.from(json["available_locations"].map((x) => x)),
        locations: List<Location>.from(
            json["locations"].map((x) => locationValues.map[x])),
        id: json["id"]??0,
        sku: json["sku"]??'',
        barcode: json["barcode"] ?? '',
        compareAtPriceUsd: json["compare_at_price_usd"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "merged_options": List<dynamic>.from(
            mergedOptions.map((x) => mergedOptionValues.reverse[x])),
        "inventory_quantity": inventoryQuantity,
        "price_usd": priceUsd,
        "image": image,
       // "presentment_prices":
       //     List<dynamic>.from(presentmentPrices.map((x) => x.toJson())),
       // "inventory_quantities": Map.from(inventoryQuantities)
       //    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "compare_at_price": compareAtPrice,
        "inventory_management":
            inventoryManagementValues.reverse[inventoryManagement],
        "fulfillment_service":
            fulfillmentServiceValues.reverse[fulfillmentService],
        "available": available,
        "weight": weight,
        "title": titleValues.reverse[title],
        "inventory_policy": inventoryPolicyValues.reverse[inventoryPolicy],
        "weight_unit": weightUnitValues.reverse[weightUnit],
        "price": price,
        "available_locations":
            List<dynamic>.from(availableLocations.map((x) => x)),
        "locations":
            List<dynamic>.from(locations.map((x) => locationValues.reverse[x])),
        "id": id,
        "sku": sku,
        "barcode": barcode,
        "compare_at_price_usd": compareAtPriceUsd,
      };
}

enum FulfillmentService { MANUAL }

final fulfillmentServiceValues =
    EnumValues({"manual": FulfillmentService.MANUAL});

enum InventoryManagement { SHOPIFY }

final inventoryManagementValues =
    EnumValues({"shopify": InventoryManagement.SHOPIFY});

enum InventoryPolicy { DENY }

final inventoryPolicyValues = EnumValues({"deny": InventoryPolicy.DENY});

enum MergedOption { TITLE_DEFAULT_TITLE }

final mergedOptionValues =
    EnumValues({"title:Default Title": MergedOption.TITLE_DEFAULT_TITLE});

class PresentmentPrice {
  PresentmentPrice({
    // this.compareAtPrice,
    required this.price,
  });

  //dynamic compareAtPrice;
  Price price;

  factory PresentmentPrice.fromRawJson(String str) =>
      PresentmentPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PresentmentPrice.fromJson(Map<String, dynamic> json) =>
      PresentmentPrice(
        //compareAtPrice: Price.fromJson(json["compare_at_price"]??[]),
        price: Price.fromJson(json["price"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        // "compare_at_price": compareAtPrice.toJson(),
        "price": price.toJson(),
      };
}

class Price {
  Price({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currencyCode: json["currency_code"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency_code": currencyCodeValues.reverse[currencyCode],
      };
}

enum CurrencyCode { USD }

final currencyCodeValues = EnumValues({"USD": CurrencyCode.USD});

enum WeightUnit { KG }

final weightUnitValues = EnumValues({"kg": WeightUnit.KG});

enum Vendor { ALHAFIDH }

final vendorValues = EnumValues({"ALHAFIDH": Vendor.ALHAFIDH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
