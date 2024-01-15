import 'dart:convert';

class OrderModel {
  OrderModel({
    required this.order,
  });

  Order order;

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
      };
}

class Order {
  Order({
    required this.id,
    required this.adminGraphqlApiId,
    required this.appId,
    required this.browserIp,
    required this.buyerAcceptsMarketing,
    required this.cancelReason,
    required this.cancelledAt,
    required this.cartToken,
    required this.checkoutId,
    required this.checkoutToken,
    required this.closedAt,
    required this.company,
    required this.confirmed,
    required this.contactEmail,
    required this.createdAt,
    required this.currency,
    required this.currentSubtotalPrice,
    required this.currentSubtotalPriceSet,
    required this.currentTotalDiscounts,
    required this.currentTotalDiscountsSet,
    required this.currentTotalDutiesSet,
    required this.currentTotalPrice,
    required this.currentTotalPriceSet,
    required this.currentTotalTax,
    required this.currentTotalTaxSet,
    required this.customerLocale,
    required this.deviceId,
    required this.discountCodes,
    required this.email,
    required this.estimatedTaxes,
    required this.financialStatus,
    required this.fulfillmentStatus,
    required this.gateway,
    required this.landingSite,
    required this.landingSiteRef,
    required this.locationId,
    required this.merchantOfRecordAppId,
    required this.name,
    required this.note,
    required this.noteAttributes,
    required this.number,
    required this.orderNumber,
    required this.orderStatusUrl,
    required this.originalTotalDutiesSet,
    required this.paymentGatewayNames,
    required this.phone,
    required this.presentmentCurrency,
    required this.processedAt,
    required this.processingMethod,
    required this.reference,
    required this.referringSite,
    required this.sourceIdentifier,
    required this.sourceName,
    required this.sourceUrl,
    required this.subtotalPrice,
    required this.subtotalPriceSet,
    required this.tags,
    required this.taxLines,
    required this.taxesIncluded,
    required this.test,
    required this.token,
    required this.totalDiscounts,
    required this.totalDiscountsSet,
    required this.totalLineItemsPrice,
    required this.totalLineItemsPriceSet,
    required this.totalOutstanding,
    required this.totalPrice,
    required this.totalPriceSet,
    required this.totalShippingPriceSet,
    required this.totalTax,
    required this.totalTaxSet,
    required this.totalTipReceived,
    required this.totalWeight,
    required this.updatedAt,
    required this.userId,
    required this.customer,
    required this.discountApplications,
    required this.fulfillments,
    required this.lineItems,
    required this.paymentTerms,
    required this.refunds,
    required this.shippingAddress,
    required this.shippingLines,
  });

  int id;
  String adminGraphqlApiId;
  int appId;
  dynamic browserIp;
  bool buyerAcceptsMarketing;
  dynamic cancelReason;
  dynamic cancelledAt;
  dynamic cartToken;
  dynamic checkoutId;
  dynamic checkoutToken;
  dynamic closedAt;
  dynamic company;
  bool confirmed;
  String contactEmail;
  DateTime createdAt;
  String currency;
  String currentSubtotalPrice;
  Set currentSubtotalPriceSet;
  String currentTotalDiscounts;
  Set currentTotalDiscountsSet;
  dynamic currentTotalDutiesSet;
  String currentTotalPrice;
  Set currentTotalPriceSet;
  String currentTotalTax;
  Set currentTotalTaxSet;
  dynamic customerLocale;
  dynamic deviceId;
  List<DiscountCode> discountCodes;
  String email;
  bool estimatedTaxes;
  String financialStatus;
  dynamic fulfillmentStatus;
  String gateway;
  dynamic landingSite;
  dynamic landingSiteRef;
  dynamic locationId;
  dynamic merchantOfRecordAppId;
  String name;
  String note;
  List<dynamic> noteAttributes;
  int number;
  int orderNumber;
  String orderStatusUrl;
  dynamic originalTotalDutiesSet;
  List<String> paymentGatewayNames;
  dynamic phone;
  String presentmentCurrency;
  DateTime processedAt;
  String processingMethod;
  dynamic reference;
  dynamic referringSite;
  dynamic sourceIdentifier;
  String sourceName;
  dynamic sourceUrl;
  String subtotalPrice;
  Set subtotalPriceSet;
  String tags;
  List<dynamic> taxLines;
  bool taxesIncluded;
  bool test;
  String token;
  String totalDiscounts;
  Set totalDiscountsSet;
  String totalLineItemsPrice;
  Set totalLineItemsPriceSet;
  String totalOutstanding;
  String totalPrice;
  Set totalPriceSet;
  Set totalShippingPriceSet;
  String totalTax;
  Set totalTaxSet;
  String totalTipReceived;
  int totalWeight;
  DateTime updatedAt;
  dynamic userId;
  Customer customer;
  List<DiscountApplication> discountApplications;
  List<dynamic> fulfillments;
  List<LineItem> lineItems;
  dynamic paymentTerms;
  List<dynamic> refunds;
  Address shippingAddress;
  List<ShippingLine> shippingLines;

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        appId: json["app_id"],
        browserIp: json["browser_ip"],
        buyerAcceptsMarketing: json["buyer_accepts_marketing"],
        cancelReason: json["cancel_reason"],
        cancelledAt: json["cancelled_at"],
        cartToken: json["cart_token"],
        checkoutId: json["checkout_id"],
        checkoutToken: json["checkout_token"],
        closedAt: json["closed_at"],
        company: json["company"],
        confirmed: json["confirmed"],
        contactEmail: json["contact_email"],
        createdAt: DateTime.parse(json["created_at"]),
        currency: json["currency"],
        currentSubtotalPrice: json["current_subtotal_price"],
        currentSubtotalPriceSet:
            Set.fromJson(json["current_subtotal_price_set"]),
        currentTotalDiscounts: json["current_total_discounts"],
        currentTotalDiscountsSet:
            Set.fromJson(json["current_total_discounts_set"]),
        currentTotalDutiesSet: json["current_total_duties_set"],
        currentTotalPrice: json["current_total_price"],
        currentTotalPriceSet: Set.fromJson(json["current_total_price_set"]),
        currentTotalTax: json["current_total_tax"],
        currentTotalTaxSet: Set.fromJson(json["current_total_tax_set"]),
        customerLocale: json["customer_locale"],
        deviceId: json["device_id"],
        discountCodes: List<DiscountCode>.from(
            json["discount_codes"].map((x) => DiscountCode.fromJson(x))),
        email: json["email"],
        estimatedTaxes: json["estimated_taxes"],
        financialStatus: json["financial_status"],
        fulfillmentStatus: json["fulfillment_status"],
        gateway: json["gateway"],
        landingSite: json["landing_site"],
        landingSiteRef: json["landing_site_ref"],
        locationId: json["location_id"],
        merchantOfRecordAppId: json["merchant_of_record_app_id"],
        name: json["name"],
        note: json["note"]??'',
        noteAttributes:
            List<dynamic>.from(json["note_attributes"].map((x) => x)),
        number: json["number"],
        orderNumber: json["order_number"],
        orderStatusUrl: json["order_status_url"],
        originalTotalDutiesSet: json["original_total_duties_set"],
        paymentGatewayNames:
            List<String>.from(json["payment_gateway_names"].map((x) => x)),
        phone: json["phone"],
        presentmentCurrency: json["presentment_currency"],
        processedAt: DateTime.parse(json["processed_at"]),
        processingMethod: json["processing_method"],
        reference: json["reference"],
        referringSite: json["referring_site"],
        sourceIdentifier: json["source_identifier"],
        sourceName: json["source_name"],
        sourceUrl: json["source_url"],
        subtotalPrice: json["subtotal_price"],
        subtotalPriceSet: Set.fromJson(json["subtotal_price_set"]),
        tags: json["tags"],
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
        taxesIncluded: json["taxes_included"],
        test: json["test"],
        token: json["token"],
        totalDiscounts: json["total_discounts"],
        totalDiscountsSet: Set.fromJson(json["total_discounts_set"]),
        totalLineItemsPrice: json["total_line_items_price"],
        totalLineItemsPriceSet:
            Set.fromJson(json["total_line_items_price_set"]),
        totalOutstanding: json["total_outstanding"],
        totalPrice: json["total_price"],
        totalPriceSet: Set.fromJson(json["total_price_set"]),
        totalShippingPriceSet: Set.fromJson(json["total_shipping_price_set"]),
        totalTax: json["total_tax"],
        totalTaxSet: Set.fromJson(json["total_tax_set"]),
        totalTipReceived: json["total_tip_received"],
        totalWeight: json["total_weight"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        customer: Customer.fromJson(json["customer"]),
        discountApplications: List<DiscountApplication>.from(
            json["discount_applications"]
                .map((x) => DiscountApplication.fromJson(x))),
        fulfillments: List<dynamic>.from(json["fulfillments"].map((x) => x)),
        lineItems: List<LineItem>.from(
            json["line_items"].map((x) => LineItem.fromJson(x))),
        paymentTerms: json["payment_terms"],
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        shippingAddress: Address.fromJson(json["shipping_address"]),
        shippingLines: List<ShippingLine>.from(
            json["shipping_lines"].map((x) => ShippingLine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_graphql_api_id": adminGraphqlApiId,
        "app_id": appId,
        "browser_ip": browserIp,
        "buyer_accepts_marketing": buyerAcceptsMarketing,
        "cancel_reason": cancelReason,
        "cancelled_at": cancelledAt,
        "cart_token": cartToken,
        "checkout_id": checkoutId,
        "checkout_token": checkoutToken,
        "closed_at": closedAt,
        "company": company,
        "confirmed": confirmed,
        "contact_email": contactEmail,
        "created_at": createdAt.toIso8601String(),
        "currency": currency,
        "current_subtotal_price": currentSubtotalPrice,
        "current_subtotal_price_set": currentSubtotalPriceSet.toJson(),
        "current_total_discounts": currentTotalDiscounts,
        "current_total_discounts_set": currentTotalDiscountsSet.toJson(),
        "current_total_duties_set": currentTotalDutiesSet,
        "current_total_price": currentTotalPrice,
        "current_total_price_set": currentTotalPriceSet.toJson(),
        "current_total_tax": currentTotalTax,
        "current_total_tax_set": currentTotalTaxSet.toJson(),
        "customer_locale": customerLocale,
        "device_id": deviceId,
        "discount_codes":
            List<dynamic>.from(discountCodes.map((x) => x.toJson())),
        "email": email,
        "estimated_taxes": estimatedTaxes,
        "financial_status": financialStatus,
        "fulfillment_status": fulfillmentStatus,
        "gateway": gateway,
        "landing_site": landingSite,
        "landing_site_ref": landingSiteRef,
        "location_id": locationId,
        "merchant_of_record_app_id": merchantOfRecordAppId,
        "name": name,
        "note": note,
        "note_attributes": List<dynamic>.from(noteAttributes.map((x) => x)),
        "number": number,
        "order_number": orderNumber,
        "order_status_url": orderStatusUrl,
        "original_total_duties_set": originalTotalDutiesSet,
        "payment_gateway_names":
            List<dynamic>.from(paymentGatewayNames.map((x) => x)),
        "phone": phone,
        "presentment_currency": presentmentCurrency,
        "processed_at": processedAt.toIso8601String(),
        "processing_method": processingMethod,
        "reference": reference,
        "referring_site": referringSite,
        "source_identifier": sourceIdentifier,
        "source_name": sourceName,
        "source_url": sourceUrl,
        "subtotal_price": subtotalPrice,
        "subtotal_price_set": subtotalPriceSet.toJson(),
        "tags": tags,
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
        "taxes_included": taxesIncluded,
        "test": test,
        "token": token,
        "total_discounts": totalDiscounts,
        "total_discounts_set": totalDiscountsSet.toJson(),
        "total_line_items_price": totalLineItemsPrice,
        "total_line_items_price_set": totalLineItemsPriceSet.toJson(),
        "total_outstanding": totalOutstanding,
        "total_price": totalPrice,
        "total_price_set": totalPriceSet.toJson(),
        "total_shipping_price_set": totalShippingPriceSet.toJson(),
        "total_tax": totalTax,
        "total_tax_set": totalTaxSet.toJson(),
        "total_tip_received": totalTipReceived,
        "total_weight": totalWeight,
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "customer": customer.toJson(),
        "discount_applications":
            List<dynamic>.from(discountApplications.map((x) => x.toJson())),
        "fulfillments": List<dynamic>.from(fulfillments.map((x) => x)),
        "line_items": List<dynamic>.from(lineItems.map((x) => x.toJson())),
        "payment_terms": paymentTerms,
        "refunds": List<dynamic>.from(refunds.map((x) => x)),
        "shipping_address": shippingAddress.toJson(),
        "shipping_lines":
            List<dynamic>.from(shippingLines.map((x) => x.toJson())),
      };
}

class Set {
  Set({
    required this.shopMoney,
    required this.presentmentMoney,
  });

  Money shopMoney;
  Money presentmentMoney;

  factory Set.fromRawJson(String str) => Set.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        shopMoney: Money.fromJson(json["shop_money"]),
        presentmentMoney: Money.fromJson(json["presentment_money"]),
      );

  Map<String, dynamic> toJson() => {
        "shop_money": shopMoney.toJson(),
        "presentment_money": presentmentMoney.toJson(),
      };
}

class Money {
  Money({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory Money.fromRawJson(String str) => Money.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        amount: json["amount"],
        currencyCode: json["currency_code"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency_code": currencyCode,
      };
}

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.acceptsMarketing,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.state,
    required this.note,
    required this.verifiedEmail,
    required this.multipassIdentifier,
    required this.taxExempt,
    required this.tags,
    required this.currency,
    required this.phone,
    required this.acceptsMarketingUpdatedAt,
    required this.marketingOptInLevel,
    required this.taxExemptions,
    required this.emailMarketingConsent,
    required this.smsMarketingConsent,
    required this.adminGraphqlApiId,
    required this.defaultAddress,
  });

  int id;
  String email;
  bool acceptsMarketing;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;
  String lastName;
  String state;
  dynamic note;
  bool verifiedEmail;
  dynamic multipassIdentifier;
  bool taxExempt;
  String tags;
  String currency;
  String phone;
  DateTime acceptsMarketingUpdatedAt;
  dynamic marketingOptInLevel;
  List<dynamic> taxExemptions;
  MarketingConsent emailMarketingConsent;
  MarketingConsent smsMarketingConsent;
  String adminGraphqlApiId;
  Address defaultAddress;

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        email: json["email"],
        acceptsMarketing: json["accepts_marketing"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        state: json["state"],
        note: json["note"],
        verifiedEmail: json["verified_email"],
        multipassIdentifier: json["multipass_identifier"],
        taxExempt: json["tax_exempt"],
        tags: json["tags"],
        currency: json["currency"],
        phone: json["phone"]??'',
        acceptsMarketingUpdatedAt:
            DateTime.parse(json["accepts_marketing_updated_at"]),
        marketingOptInLevel: json["marketing_opt_in_level"],
        taxExemptions: List<dynamic>.from(json["tax_exemptions"].map((x) => x)),
        emailMarketingConsent:
            MarketingConsent.fromJson(json["email_marketing_consent"]),
        smsMarketingConsent:
            MarketingConsent.fromJson(json["sms_marketing_consent"]??{}),
        adminGraphqlApiId: json["admin_graphql_api_id"],
        defaultAddress: Address.fromJson(json["default_address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "accepts_marketing": acceptsMarketing,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "state": state,
        "note": note,
        "verified_email": verifiedEmail,
        "multipass_identifier": multipassIdentifier,
        "tax_exempt": taxExempt,
        "tags": tags,
        "currency": currency,
        "phone": phone,
        "accepts_marketing_updated_at":
            acceptsMarketingUpdatedAt.toIso8601String(),
        "marketing_opt_in_level": marketingOptInLevel,
        "tax_exemptions": List<dynamic>.from(taxExemptions.map((x) => x)),
        "email_marketing_consent": emailMarketingConsent.toJson(),
        "sms_marketing_consent": smsMarketingConsent.toJson(),
        "admin_graphql_api_id": adminGraphqlApiId,
        "default_address": defaultAddress.toJson(),
      };
}

class Address {
  Address({
    required this.id,
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.province,
    required this.country,
    required this.zip,
    required this.phone,
    required this.name,
    required this.provinceCode,
    required this.countryCode,
    required this.countryName,
    required this.addressDefault,
    required this.latitude,
    required this.longitude,
  });

  int id;
  int customerId;
  String firstName;
  String lastName;
  dynamic company;
  String address1;
  String address2;
  String city;
  String province;
  String country;
  String zip;
  String phone;
  String name;
  dynamic provinceCode;
  String countryCode;
  String countryName;
  bool addressDefault;
  dynamic latitude;
  dynamic longitude;

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"]??0,
        customerId: json["customer_id"]??0,
        firstName: json["first_name"]??'',
        lastName: json["last_name"]??'',
        company: json["company"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        province: json["province"]??'',
        country: json["country"],
        zip: json["zip"]??"",
        phone: json["phone"]??'',
        name: json["name"]??'',
        provinceCode: json["province_code"] ,
        countryCode: json["country_code"],
        countryName: json["country_name"]??'',
        addressDefault: json["default"]??false,
        latitude: json["latitude"]??0,
        longitude: json["longitude"]??0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address1": address1,
        "address2": address2,
        "city": city,
        "province": province,
        "country": country,
        "zip": zip,
        "phone": phone,
        "name": name,
        "province_code": provinceCode,
        "country_code": countryCode,
        "country_name": countryName,
        "default": addressDefault,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class MarketingConsent {
  MarketingConsent({
    required this.state,
    required this.optInLevel,
    required this.consentUpdatedAt,
    required this.consentCollectedFrom,
  });

  String state;
  String optInLevel;
  dynamic consentUpdatedAt;
  String consentCollectedFrom;

  factory MarketingConsent.fromRawJson(String str) =>
      MarketingConsent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketingConsent.fromJson(Map<String, dynamic> json) =>
      MarketingConsent(
        state: json["state"]??'',
        optInLevel: json["opt_in_level"]??"",
        consentUpdatedAt: json["consent_updated_at"]??{},
        consentCollectedFrom: json["consent_collected_from"]??'',
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "opt_in_level": optInLevel,
        "consent_updated_at": consentUpdatedAt,
        "consent_collected_from": consentCollectedFrom,
      };
}

class DiscountApplication {
  DiscountApplication({
    required this.targetType,
    required this.type,
    required this.value,
    required this.valueType,
    required this.allocationMethod,
    required this.targetSelection,
    required this.title,
    required this.description,
  });

  String targetType;
  String type;
  String value;
  String valueType;
  String allocationMethod;
  String targetSelection;
  String title;
  String description;

  factory DiscountApplication.fromRawJson(String str) =>
      DiscountApplication.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountApplication.fromJson(Map<String, dynamic> json) =>
      DiscountApplication(
        targetType: json["target_type"]??'',
        type: json["type"]??'',
        value: json["value"]??'',
        valueType: json["value_type"]??'',
        allocationMethod: json["allocation_method"]??'',
        targetSelection: json["target_selection"]??'',
        title: json["title"]??'',
        description: json["description"]??'',
      );

  Map<String, dynamic> toJson() => {
        "target_type": targetType,
        "type": type,
        "value": value,
        "value_type": valueType,
        "allocation_method": allocationMethod,
        "target_selection": targetSelection,
        "title": title,
        "description": description,
      };
}

class DiscountCode {
  DiscountCode({
    required this.code,
    required this.amount,
    required this.type,
  });

  String code;
  String amount;
  String type;

  factory DiscountCode.fromRawJson(String str) =>
      DiscountCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountCode.fromJson(Map<String, dynamic> json) => DiscountCode(
        code: json["code"]??'',
        amount: json["amount"]??'',
        type: json["type"]??'',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "amount": amount,
        "type": type,
      };
}

class LineItem {
  LineItem({
    required this.id,
    required this.adminGraphqlApiId,
    required this.fulfillableQuantity,
    required this.fulfillmentService,
    required this.fulfillmentStatus,
    required this.giftCard,
    required this.grams,
    required this.name,
    required this.price,
    required this.priceSet,
    required this.productExists,
    required this.productId,
    required this.properties,
    required this.quantity,
    required this.requiresShipping,
    required this.sku,
    required this.taxable,
    required this.title,
    required this.totalDiscount,
    required this.totalDiscountSet,
    required this.variantId,
    required this.variantInventoryManagement,
    required this.variantTitle,
    required this.vendor,
    required this.taxLines,
    required this.duties,
    required this.discountAllocations,
  });

  int id;
  String adminGraphqlApiId;
  int fulfillableQuantity;
  String fulfillmentService;
  dynamic fulfillmentStatus;
  bool giftCard;
  int grams;
  String name;
  String price;
  Set priceSet;
  bool productExists;
  dynamic productId;
  List<dynamic> properties;
  int quantity;
  bool requiresShipping;
  dynamic sku;
  bool taxable;
  String title;
  String totalDiscount;
  Set totalDiscountSet;
  dynamic variantId;
  dynamic variantInventoryManagement;
  dynamic variantTitle;
  dynamic vendor;
  List<dynamic> taxLines;
  List<dynamic> duties;
  List<DiscountAllocation> discountAllocations;

  factory LineItem.fromRawJson(String str) =>
      LineItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        fulfillableQuantity: json["fulfillable_quantity"],
        fulfillmentService: json["fulfillment_service"],
        fulfillmentStatus: json["fulfillment_status"],
        giftCard: json["gift_card"],
        grams: json["grams"],
        name: json["name"],
        price: json["price"],
        priceSet: Set.fromJson(json["price_set"]),
        productExists: json["product_exists"],
        productId: json["product_id"],
        properties: List<dynamic>.from(json["properties"].map((x) => x)),
        quantity: json["quantity"],
        requiresShipping: json["requires_shipping"],
        sku: json["sku"],
        taxable: json["taxable"],
        title: json["title"],
        totalDiscount: json["total_discount"],
        totalDiscountSet: Set.fromJson(json["total_discount_set"]),
        variantId: json["variant_id"],
        variantInventoryManagement: json["variant_inventory_management"],
        variantTitle: json["variant_title"],
        vendor: json["vendor"],
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
        duties: List<dynamic>.from(json["duties"].map((x) => x)),
        discountAllocations: List<DiscountAllocation>.from(
            json["discount_allocations"]
                .map((x) => DiscountAllocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_graphql_api_id": adminGraphqlApiId,
        "fulfillable_quantity": fulfillableQuantity,
        "fulfillment_service": fulfillmentService,
        "fulfillment_status": fulfillmentStatus,
        "gift_card": giftCard,
        "grams": grams,
        "name": name,
        "price": price,
        "price_set": priceSet.toJson(),
        "product_exists": productExists,
        "product_id": productId,
        "properties": List<dynamic>.from(properties.map((x) => x)),
        "quantity": quantity,
        "requires_shipping": requiresShipping,
        "sku": sku,
        "taxable": taxable,
        "title": title,
        "total_discount": totalDiscount,
        "total_discount_set": totalDiscountSet.toJson(),
        "variant_id": variantId,
        "variant_inventory_management": variantInventoryManagement,
        "variant_title": variantTitle,
        "vendor": vendor,
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
        "duties": List<dynamic>.from(duties.map((x) => x)),
        "discount_allocations":
            List<dynamic>.from(discountAllocations.map((x) => x.toJson())),
      };
}

class DiscountAllocation {
  DiscountAllocation({
    required this.amount,
    required this.amountSet,
    required this.discountApplicationIndex,
  });

  String amount;
  Set amountSet;
  int discountApplicationIndex;

  factory DiscountAllocation.fromRawJson(String str) =>
      DiscountAllocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountAllocation.fromJson(Map<String, dynamic> json) =>
      DiscountAllocation(
        amount: json["amount"],
        amountSet: Set.fromJson(json["amount_set"]),
        discountApplicationIndex: json["discount_application_index"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "amount_set": amountSet.toJson(),
        "discount_application_index": discountApplicationIndex,
      };
}

class ShippingLine {
  ShippingLine({
    required this.id,
    required this.carrierIdentifier,
    required this.code,
    required this.deliveryCategory,
    required this.discountedPrice,
    required this.discountedPriceSet,
    required this.phone,
    required this.price,
    required this.priceSet,
    required this.requestedFulfillmentServiceId,
    required this.source,
    required this.title,
    required this.taxLines,
    required this.discountAllocations,
  });

  int id;
  dynamic carrierIdentifier;
  String code;
  dynamic deliveryCategory;
  String discountedPrice;
  Set discountedPriceSet;
  dynamic phone;
  String price;
  Set priceSet;
  dynamic requestedFulfillmentServiceId;
  dynamic source;
  String title;
  List<dynamic> taxLines;
  List<dynamic> discountAllocations;

  factory ShippingLine.fromRawJson(String str) =>
      ShippingLine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        id: json["id"],
        carrierIdentifier: json["carrier_identifier"],
        code: json["code"],
        deliveryCategory: json["delivery_category"],
        discountedPrice: json["discounted_price"],
        discountedPriceSet: Set.fromJson(json["discounted_price_set"]),
        phone: json["phone"],
        price: json["price"],
        priceSet: Set.fromJson(json["price_set"]),
        requestedFulfillmentServiceId: json["requested_fulfillment_service_id"],
        source: json["source"],
        title: json["title"],
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
        discountAllocations:
            List<dynamic>.from(json["discount_allocations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "carrier_identifier": carrierIdentifier,
        "code": code,
        "delivery_category": deliveryCategory,
        "discounted_price": discountedPrice,
        "discounted_price_set": discountedPriceSet.toJson(),
        "phone": phone,
        "price": price,
        "price_set": priceSet.toJson(),
        "requested_fulfillment_service_id": requestedFulfillmentServiceId,
        "source": source,
        "title": title,
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
        "discount_allocations":
            List<dynamic>.from(discountAllocations.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
