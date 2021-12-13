import 'Product.dart';
import 'delivery_person.dart';
import 'store.dart';
import 'package:intl/intl.dart';

class ProductItem {
    String? id;
  String? productId;
  String? variationId;
  String? name;
  int? quantity;
  String? total;
  String? totalTax;
  String? featuredImage;
  String? addonsOptions;
  List<String?> attributes = [];
  DeliveryUser? deliveryUser;
  List<Map<String, dynamic>?> prodOptions = []; // for opencart
  String? storeId;
  String? storeName;
  Product? product;


  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'quantity': quantity,
      'total': total,
      'featuredImage': featuredImage
    };
  }

  ProductItem.fromLocalJson(Map<String, dynamic> parsedJson) {
    productId = "${parsedJson["product_id"]}";
    name = parsedJson['name'];
    quantity = parsedJson['quantity'];
    total = parsedJson['total'].toString();
    featuredImage = parsedJson['featuredImage'];
  }

  ProductItem.fromJson(Map<String, dynamic> parsedJson) {
    try {
      productId = parsedJson['product_id'].toString();
      variationId = parsedJson['variation_id'].toString();
      name = parsedJson['name'];
      quantity = int.parse("${parsedJson["quantity"]}");
      total = parsedJson['total'];
      totalTax = parsedJson['total_tax'];
      featuredImage = parsedJson['featured_image'];
      if (parsedJson['featured_image'] != null) {
        featuredImage = parsedJson['featured_image'];
      }

      final productData = parsedJson['product_data'];
      if (productData != null) {
        try {
          product = Product.fromJson(productData);
          if (productData['store'] != null) {
          
                product?.store = Store.fromJson(productData['store']);
              
          }
          featuredImage = product!.imageFeature;
        } catch (e) {
          print('Error in product_item.dart - $name: $e');
        }
      }

      featuredImage ??= 'kDefaultImage';

      final metaData = parsedJson['meta_data'];
      if (metaData is List) {
        if (parsedJson['product_data'] != null &&
            parsedJson['product_data']['type'] == 'appointment') {
          final Map<String, dynamic>? day = metaData.firstWhere(
              (element) =>
                  element['key'] == 'wc_appointments_field_start_date_day',
              orElse: () => null);
          final Map<String, dynamic>? month = metaData.firstWhere(
              (element) =>
                  element['key'] == 'wc_appointments_field_start_date_month',
              orElse: () => null);
          final Map<String, dynamic>? year = metaData.firstWhere(
              (element) =>
                  element['key'] == 'wc_appointments_field_start_date_year',
              orElse: () => null);
          final Map<String, dynamic>? time = metaData.firstWhere(
              (element) =>
                  element['key'] == 'wc_appointments_field_start_date_time',
              orElse: () => null);
          if (day != null && month != null && year != null && time != null) {
            final dateTime = DateTime.parse(
                "${year['value']}-${month['value']}-${day['value']} ${time['value']}");
            final formatter = DateFormat.yMd().add_jm();
            addonsOptions = formatter.format(dateTime);
          }
        } else {
          addonsOptions = metaData.map((e) => e['value']).join(', ');
        }

        for (var attr in metaData) {
          if (attr['key'] == '_vendor_id') {
            storeId = attr['value'];
            storeName = attr['display_value'];
          }
        }
      }

      /// Custom meta_data. Refer to ticket https://support.inspireui.com/mailbox/tickets/9593
      // if (metaData is List) {
      //   addonsOptions = '';
      //   for (var item in metaData) {
      //     if (['attribute_pa_color'].contains(item['key'])) {
      //       if (addonsOptions!.isEmpty) {
      //         addonsOptions = '${item['value']}';
      //       } else {
      //         addonsOptions = '$addonsOptions,${item['value']}';
      //       }
      //     }
      //   }
      // }

      /// For FluxStore Manager
      if (parsedJson['meta'] != null) {
        addonsOptions = parsedJson['meta'].map((e) => e['value']).join(', ');
        parsedJson['meta'].forEach((attr) {
          for (var val in ['pa_color', 'pa_size']) {
            if (attr['key'].contains(val)) {
              attributes.add(attr['value']);
            }
          }
        });
      }
      id = parsedJson['id'].toString();
      if (parsedJson['delivery_user'] != null) {
        deliveryUser = DeliveryUser.fromJson(parsedJson['delivery_user']);
      }
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }

}
