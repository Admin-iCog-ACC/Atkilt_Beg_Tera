import 'package:flutter/material.dart';

enum DeliveryStatus {
  pending,
  delivered,
  unknown,
}

extension DeliveryStatusExtension on DeliveryStatus {
  Color displayColor(context) {
    switch (this) {
      case DeliveryStatus.pending:
        return Theme.of(context).primaryColor;
      default:
        return Theme.of(context).splashColor;
    }
  }
}
