import 'package:aishop_admin/models/orders.dart';
import 'package:aishop_admin/utils/costants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices {
  String collection = "Products";

  Future<List<OrderModel>> getAllOrders() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
