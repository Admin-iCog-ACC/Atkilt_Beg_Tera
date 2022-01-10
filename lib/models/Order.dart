import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retailer_app/models/Cart.dart';
import 'intities/address.dart';
import 'intities/shipping_location.dart';
import 'intities/store_delivry_date.dart';

import 'intities/Cart_Item.dart';
import 'intities/delivery_status.dart';
import 'product_item.dart';

enum OrderStatus {
  pending,
  processing,
  cancelled,
  refunded,
  completed,
  onHold,
  failed,
  shipped,
  delivered,
  reversed,
  canceled,
  canceledReversal,
  chargeback,
  denied,
  expired,
  processed,
  voided,
  unknown,
  refundRequested,
  driverAssigned,
  outForDelivery,
  orderReturned,
}

class Order {
  String? id;
  String? number;
  String? status;
  DateTime? createdAt;
  DateTime? dateModified;
  double? total;
  double? totalTax;
  double? totalShipping;
  String? paymentMethodTitle;
  String? paymentMethod;
  String? shippingMethodTitle;
  String? customerNote;
  String? customerId;
  List<ProductItem> lineItems = [];
  Address? billing;
  Address? shipping;
  Cart? cart;

  double? subtotal;
  DeliveryStatus? deliveryStatus;
  int quantity = 0;
  UserShippingLocation? userShippingLocation;
  String? deliveryDate;

  int get totalQuantity {
    var quantity = 0;
    for (var item in lineItems) {
      quantity += item.quantity ?? 0;
    }
    return quantity;
  }

  Order({this.id, this.number, this.status, this.createdAt, this.total});

  DeliveryStatus parseDeliveryStatus(String? status) {
    final newStatus = status?.toLowerCase();
    return DeliveryStatus.values.firstWhere(
      (element) => true,
      orElse: () => DeliveryStatus.unknown,
    );
  }

  // OrderStatus parseOrderStatus(String? status) {
  //   final newStatus = status?.toLowerCase();
  //   switch (newStatus) {
  //     case 'on-hold':
  //     case 'holded':
  //       return OrderStatus.onHold;
  //     case 'canceled reversal':
  //       return OrderStatus.canceledReversal;
  //     case 'complete':
  //       return OrderStatus.completed;
  //     case 'driver-assigned':
  //       return OrderStatus.driverAssigned;
  //     case 'out-for-delivery':
  //       return OrderStatus.outForDelivery;
  //     case 'order-returned':
  //       return OrderStatus.orderReturned;
  //     case 'refund-req':
  //       return OrderStatus.refundRequested;
  //     default:
  //       return OrderStatus.values.firstWhere(
  //         (element) => true,
  //         orElse: () => OrderStatus.unknown,
  //       );
  //   }
  // }

  Order.fromJson(Map<String, dynamic> parsedJson) {
    try {
      id = parsedJson['id'].toString();
      subtotal = double.parse(parsedJson['subTotal'].toString());
      customerNote = parsedJson['customer_note'];
      cart = Cart.fromJson(parsedJson['Cart']);
      number = parsedJson['number'];
      status = parsedJson['status'];
      createdAt = parsedJson['createdAt'] != null
          ? DateTime.parse(parsedJson['createdAt'])
          : DateTime.now();
      dateModified = parsedJson['updatedAt'] != null
          ? DateTime.parse(parsedJson['updatedAt'])
          : DateTime.now();
      total = parsedJson['total'] != null
          ? double.parse(parsedJson['total'].toString())
          : 0.0;
      totalTax = double.parse(parsedJson['totalTax'].toString());
      totalShipping = double.parse(parsedJson['totalShipping'].toString());
      paymentMethodTitle = parsedJson['payment_method_title'];
      paymentMethod = parsedJson['payment_method'];

      parsedJson['line_items']?.forEach((item) {
        lineItems.add(ProductItem.fromJson(item));
        quantity += int.parse("${item["quantity"]}");
      });

      // billing =
      //     Address.fromJson(parsedJson['billingAddress'] );
      // shipping =
      //     Address.fromJson(parsedJson['shippingAddress']);
      shippingMethodTitle = parsedJson['shipping_lines'] != null &&
              parsedJson['shipping_lines'].length > 0
          ? parsedJson['shipping_lines'][0]['method_title']
          : null;
      deliveryStatus =
          parseDeliveryStatus(parsedJson['delivery_status'] ?? 'pending');
      if (parsedJson['user_location'] != null) {
        userShippingLocation =
            UserShippingLocation.fromJson(parsedJson['user_location']);
      }

      customerId = parsedJson['customer_id'].toString();

      /// GET AFTERSHIP TRACKING & DELIVERY DATE
      if (parsedJson['meta_data'] != null) {
        var providerName = '';
        var trackingNumber = '';
        for (var item in parsedJson['meta_data']) {
          if (item['key'] == '_aftership_tracking_number') {
            trackingNumber = item['value'];
          }
          if (item['key'] == '_aftership_tracking_provider_name') {
            providerName = item['value'];
          }
          if (item['key'] == '_orddd_timestamp') {
            var format = DateFormat('dd-MM-yyyy');
            if (item['value'] != null && item['value'].isNotEmpty) {
              var timeStamp = int.parse(item['value'].toString());
              timeStamp = timeStamp * 1000;
              deliveryDate = format.format(
                DateTime.fromMillisecondsSinceEpoch(timeStamp),
              );
            }
          }
        }
      }
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }

  Order.fromLocalJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    number = parsedJson['number'];
    status = parsedJson['status'];
    createdAt = parsedJson['date_created'] != null
        ? DateTime.parse(parsedJson['date_created'])
        : DateTime.now();
    total =
        parsedJson['total'] != null ? double.parse(parsedJson['total']) : 0.0;
    totalTax = parsedJson['totalTax'] != null
        ? double.parse(parsedJson['totalTax'])
        : 0.0;
    paymentMethodTitle = parsedJson['payment_method_title'];

    parsedJson['line_items']?.forEach((item) {
      lineItems.add(ProductItem.fromLocalJson(item));
      quantity += int.parse("${item["quantity"]}");
    });

    billing = Address.fromLocalJson(parsedJson['billing']);
    shipping = Address.fromLocalJson(parsedJson['shipping']);
    shippingMethodTitle = parsedJson['shipping_lines'] != null &&
            parsedJson['shipping_lines'].length > 0
        ? parsedJson['shipping_lines'][0]['method_title']
        : null;
  }

  Map<String, dynamic> toOrderJson(CartItem cartModel, userId) {
    var items = lineItems.map((index) {
      return index.toJson();
    }).toList();

    return {
      'status': status,
      'total': total.toString(),
      'totalTax': totalTax.toString(),
      'shipping_lines': [
        {'method_title': shippingMethodTitle}
      ],
      'number': number,
      'billing': billing?.toJson(),
      'shipping': shipping?.toJson(),
      'line_items': items,
      'id': id,
      'date_created': createdAt.toString(),
      'payment_method_title': paymentMethodTitle
    };
  }

  List<Order> fromJsonList(jsonlist) {
    var json = jsonlist ?? [];
    return List<Order>.from(json.map((item) => Order.fromJson(item)));
  }
}

extension OrderStatusExtension on OrderStatus {
  bool get isCancelled => [
        OrderStatus.cancelled,
        // OrderStatus.canceled,
      ].contains(this);

  String get content => this.content;

  Color get displayColor {
    switch (this) {
      case OrderStatus.pending:
        return Colors.amber;
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.cancelled:
      case OrderStatus.canceled:
        return Colors.grey;
      case OrderStatus.refunded:
        return Colors.red;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.onHold:
        return Colors.blue;
      default:
        return Colors.yellow;
    }
  }
}
