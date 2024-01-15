// To parse this JSON data, do
//
//     final applyDiscountCode = applyDiscountCodeFromJson(jsonString);

import 'dart:convert';

class ApplyDiscountCode {
    CheckoutDiscountCodeApplyV2 checkoutDiscountCodeApplyV2;

    ApplyDiscountCode({
        required this.checkoutDiscountCodeApplyV2,
    });

    factory ApplyDiscountCode.fromRawJson(String str) => ApplyDiscountCode.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApplyDiscountCode.fromJson(Map<String, dynamic> json) => ApplyDiscountCode(
        checkoutDiscountCodeApplyV2: CheckoutDiscountCodeApplyV2.fromJson(json["checkoutDiscountCodeApplyV2"]),
    );

    Map<String, dynamic> toJson() => {
        "checkoutDiscountCodeApplyV2": checkoutDiscountCodeApplyV2.toJson(),
    };
}

class CheckoutDiscountCodeApplyV2 {
    Checkout checkout;
    List<dynamic> checkoutUserErrors;

    CheckoutDiscountCodeApplyV2({
        required this.checkout,
        required this.checkoutUserErrors,
    });

    factory CheckoutDiscountCodeApplyV2.fromRawJson(String str) => CheckoutDiscountCodeApplyV2.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckoutDiscountCodeApplyV2.fromJson(Map<String, dynamic> json) => CheckoutDiscountCodeApplyV2(
        checkout: Checkout.fromJson(json["checkout"]),
        checkoutUserErrors: List<dynamic>.from(json["checkoutUserErrors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "checkout": checkout.toJson(),
        "checkoutUserErrors": List<dynamic>.from(checkoutUserErrors.map((x) => x)),
    };
}

class Checkout {
    String id;
    TotalPrice totalPrice;

    Checkout({
        required this.id,
        required this.totalPrice,
    });

    factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"],
        totalPrice: TotalPrice.fromJson(json["totalPrice"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice.toJson(),
    };
}

class TotalPrice {
    String amount;

    TotalPrice({
        required this.amount,
    });

    factory TotalPrice.fromRawJson(String str) => TotalPrice.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
    };
}