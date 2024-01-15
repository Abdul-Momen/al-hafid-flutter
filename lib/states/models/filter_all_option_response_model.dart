import 'dart:convert';

class FilterAllOptionResponseModel {
  FilterAllOptionResponseModel({
    required this.totalProduct,
    required this.totalCollection,
    required this.totalPage,
    required this.fromCache,
    // required this.products,
    required this.eventType,
    required this.filter,
    required this.affectedByMerchandising,
  });

  int totalProduct;
  int totalCollection;
  int totalPage;
  bool fromCache;

  // List<Product> products;
  dynamic eventType;
  Filter filter;
  bool affectedByMerchandising;

  factory FilterAllOptionResponseModel.fromRawJson(String str) =>
      FilterAllOptionResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FilterAllOptionResponseModel.fromJson(Map<String, dynamic> json) =>
      FilterAllOptionResponseModel(
        totalProduct: json["total_product"],
        totalCollection: json["total_collection"],
        totalPage: json["total_page"],
        fromCache: json["from_cache"],
        // products: List<Product>.from(
        // json["products"].map((x) => Product.fromJson(x))),
        eventType: json["event_type"],
        filter: Filter.fromJson(json["filter"]),
        affectedByMerchandising: json["affected_by_merchandising"],
      );

  Map<String, dynamic> toJson() => {
        "total_product": totalProduct,
        "total_collection": totalCollection,
        "total_page": totalPage,
        "from_cache": fromCache,
        //"products": List<dynamic>.from(products.map((x) => x.toJson())),
        "event_type": eventType,
        "filter": filter.toJson(),
        "affected_by_merchandising": affectedByMerchandising,
      };
}

class Filter {
  Filter({
    required this.options,
  });

  List<FOption> options;

  factory Filter.fromRawJson(String str) => Filter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        options: List<FOption>.from(
            json["options"].map((x) => FOption.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class FOption {
  FOption({
    required this.filterOptionId,
    // required this.displayType,
    required this.filterType,
    required this.label,
    required this.position,
    // required this.selectType,
    // required this.valueType,
    // required this.status,
    // required this.hideTextBoxes,
    this.values,
    // required this.tooltip,
    // required this.showMoreType,
    required this.manualValues,
    required this.manualValues2,
    // required this.removeTextFilterValues,
    // required this.replaceTextFilterValues,
    // required this.excludedValues,
    required this.isCollapseMobile,
    required this.isCollapsePc,
    required this.displayAllValuesInUppercaseForm,
    required this.showSearchBoxFilterMobile,
    required this.showSearchBoxFilterPc,
    required this.sortManualValues,
    // required this.sortType,
    // required this.swatchStyle,
    required this.prefix,
  });

  String filterOptionId;

  // dynamic displayType;
  String filterType;
  String label;
  int position;

  // dynamic selectType;
  // dynamic valueType;
  // dynamic status;
  // bool hideTextBoxes;
  List<Value>? values;

  // dynamic tooltip;
  // dynamic showMoreType;
  List<String> manualValues;
  List<Value> manualValues2;

  // String removeTextFilterValues;
  // dynamic replaceTextFilterValues;
  // List<dynamic> excludedValues;
  bool isCollapseMobile;
  bool isCollapsePc;
  bool displayAllValuesInUppercaseForm;
  bool showSearchBoxFilterMobile;
  bool showSearchBoxFilterPc;
  bool sortManualValues;

  // dynamic sortType;
  // dynamic swatchStyle;
  String prefix;

  factory FOption.fromRawJson(String str) => FOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FOption.fromJson(Map<String, dynamic> json) => FOption(
        filterOptionId: json["filterOptionId"] ?? '',
        // displayType: displayTypeValues.map[json["displayType"]],
        filterType: json["filterType"] ?? '',
        label: json["label"] ?? '',
        position: json["position"] ?? 0,
        // selectType: selectTypeValues.map[json["selectType"]],
        // valueType: valueTypeValues.map[json["valueType"]],
        // status: statusValues.map[json["status"]],
        // hideTextBoxes: json["hideTextBoxes"],

        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]?.map((x) => Value.fromJson(x))),

        // tooltip: json["tooltip"],
        // showMoreType: showMoreTypeValues.map[json["showMoreType"]],
        manualValues: json["manualValues"] == null
            ? []
            : json["manualValues"] is List<String>
                ? List<String>.from(json["manualValues"]?.map((x) => x))
                : [],

        manualValues2: json["manualValues"] == null
            ? []
            : json["manualValues"] is List<Value>
                ? List<Value>.from(
                    json["manualValues"]?.map((x) => Value.fromJson(x)))
                : [],
        // removeTextFilterValues: json["removeTextFilterValues"],
        // replaceTextFilterValues: json["replaceTextFilterValues"],
        // excludedValues:
        //     List<dynamic>.from(json["excludedValues"].map((x) => x)),
        isCollapseMobile: json["isCollapseMobile"] ?? false,
        isCollapsePc: json["isCollapsePC"] ?? false,
        displayAllValuesInUppercaseForm:
            json["displayAllValuesInUppercaseForm"] ?? false,
        showSearchBoxFilterMobile: json["showSearchBoxFilterMobile"] ?? false,
        showSearchBoxFilterPc: json["showSearchBoxFilterPC"] ?? false,
        sortManualValues: json["sortManualValues"] ?? false,
        // sortType: sortTypeValues.map[json["sortType"]],
        // swatchStyle: swatchStyleValues.map[json["swatchStyle"]],
        prefix: json["prefix"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "filterOptionId": filterOptionId,
        // "displayType": displayTypeValues.reverse[displayType],
        "filterType": filterType,
        "label": label,
        "position": position,
        // "selectType": selectTypeValues.reverse[selectType],
        // "valueType": valueTypeValues.reverse[valueType],
        // "status": statusValues.reverse[status],
        // "hideTextBoxes": hideTextBoxes,

        "values": List<dynamic>.from(values!.map((x) => x.toJson())),
        // "manualValues": List<dynamic>.from(values!.map((x) => x.toJson())) ,
        // "tooltip": tooltip,
        // "showMoreType": showMoreTypeValues.reverse[showMoreType],
        // "manualValues": List<dynamic>.from(manualValues!.map((x) => x)),
        // "removeTextFilterValues": removeTextFilterValues,
        // "replaceTextFilterValues": replaceTextFilterValues,
        // "excludedValues": List<dynamic>.from(excludedValues.map((x) => x)),
        "isCollapseMobile": isCollapseMobile,
        "isCollapsePC": isCollapsePc,
        "displayAllValuesInUppercaseForm": displayAllValuesInUppercaseForm,
        "showSearchBoxFilterMobile": showSearchBoxFilterMobile,
        "showSearchBoxFilterPC": showSearchBoxFilterPc,
        "sortManualValues": sortManualValues,
        // "sortType": sortTypeValues.reverse[sortType],
        // "swatchStyle": swatchStyleValues.reverse[swatchStyle],
        "prefix": prefix,
      };
}

class Value {
  Value({
    this.key,
    // required this.label,
    //this.docCount,
    this.isSelected,
  });

  String? key;
  bool? isSelected;

  // String label;
  //int? docCount;

  factory Value.fromRawJson(String str) => Value.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        key: json["key"] ?? '',
        // label: json["label"] ?? '',
        //docCount: json["doc_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        // "label": label,
        //"doc_count": docCount,
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
    this.key,
    this.label,
    this.docCount,
  });

  String? key;
  String? label;
  int? docCount;

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
  dynamic title;

  factory OptionsWithValueValue.fromRawJson(String str) =>
      OptionsWithValueValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OptionsWithValueValue.fromJson(Map<String, dynamic> json) =>
      OptionsWithValueValue(
        image: json["image"],
        title: titleValues.map[json["title"]],
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

enum Barcode { EMPTY, UA55_TU8500_UXTW, THE_880164_E_12 }

final barcodeValues = EnumValues({
  "": Barcode.EMPTY,
  "8.80164E+12": Barcode.THE_880164_E_12,
  "UA55TU8500UXTW": Barcode.UA55_TU8500_UXTW
});

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
    required this.compareAtPrice,
    required this.price,
  });

  dynamic compareAtPrice;
  dynamic price;

  factory PresentmentPrice.fromRawJson(String str) =>
      PresentmentPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PresentmentPrice.fromJson(Map<String, dynamic> json) =>
      PresentmentPrice(
        compareAtPrice: Price.fromJson(json["compare_at_price"] ?? 0),
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "compare_at_price": compareAtPrice.toJson(),
        "price": price.toJson(),
      };
}

class Price {
  Price({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  dynamic currencyCode;

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currencyCode: currencyCodeValues.map[json["currency_code"]],
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

enum Vendor { ALHAFIDH, SAMSUNG }

final vendorValues =
    EnumValues({"ALHAFIDH": Vendor.ALHAFIDH, "Samsung": Vendor.SAMSUNG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
