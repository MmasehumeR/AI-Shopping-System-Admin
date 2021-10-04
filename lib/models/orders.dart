import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const NAME = "name";
  static const DESCRIPTION = "description";
  static const PRICE = "price";
  // static const USER_ID = "userId";
  static const QUANTITY = "stockamt";
  // static const STATUS = "status";
  // static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _name;
  int _price;
  int _quantity;
  // int _total;

//  getters
  String get id => _id;

  String get description => _description;

  String get name => _name;

  String get price => _price.toString();

  int get quantity => _quantity;

  // int get createdAt => _createdAt;

  // public variable
  // List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID].toString();
    _description = snapshot.data()[DESCRIPTION];
    _price = snapshot.data()[PRICE];
    _quantity = snapshot.data()[QUANTITY];
    _name = snapshot.data()[NAME].toString();
    // _createdAt = snapshot.data()[CREATED_AT];
    // cart = snapshot.data()[CART];
  }
}
