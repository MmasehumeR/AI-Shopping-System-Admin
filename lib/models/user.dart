import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "fname";
  static const SURNAME = "lname";
  static const EMAIL = "email";
  static const PROVINCE = "province";
  static const BIRTHDAY = "bday";

  String _id;
  String _name;
  String _email;
  String _surname;
  String _province;
  String _birthday;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get surname => _surname;
  String get province => _province;
  String get birthday => _birthday;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    // print("id is " + _id);
    _surname = snapshot.data()[SURNAME];
    _province = snapshot.data()[PROVINCE];
    _birthday = snapshot.data()[BIRTHDAY];
    
  }
}
