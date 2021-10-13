import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aishop_admin/widgets/header/page_header.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  static const lightblack = Color(0xFF181818);
  static const black = Color(0xFF000000);
  // static const white = Color(0xFFFFFFFF);

  // ignore: non_constant_identifier_names
  String Name,Category,Description,Price,URL,productid;
  String imageURL;

  additem(String name,String category,String description,String price,String URL) async {

    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day, now.hour, now.minute);

    CollectionReference docRef = FirebaseFirestore.instance.collection('Products');
    docRef.add({
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'stockamt': 100,
      'clicks': 0,
      'Purchased by': 0,
      'date': date,
      // 'url' : imageURL.toString()
      'url': URL
    }).then((value) => docRef.doc(value.id.toString()).update({
      'id' : value.id.toString()
    }))
        .catchError((error) => print("Failed to add user: $error"));
  }

  File _image;

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
      // ignore: deprecated_member_use
      pickedFile = await picker.getImage(
        source: ImageSource.gallery,);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  upload(String category){
    FirebaseStorage storageReference = FirebaseStorage.instance;
    storageReference.ref()
        .child("Clothes/${Path.basename(_image.path)}")
        .putFile(_image).onError((error, stackTrace) => null);
          // .then((myimage) => myimage.ref.getDownloadURL()
          //   .then((valueURL) => imageURL = valueURL));
  //   if(imageURL!=null){
  //     dynamic key=CreateCryptoRandomString(32);
  //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
          children: [
            PageHeader(
              text: 'Add New Product',
            ),
            // InkWell(
            //     child: Container(
            //       child: (imageURL != null)
            //           ? Image.network(imageURL)
            //           : Image.asset(
            //         'images/add.png',
            //       ),
            //       width: 100,
            //       height: 100,
            //     ),
            //     onTap:(){
            //       getImage();
            //     }
            // ),
            SizedBox(height: 20.0,),
            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
              child: Text("Name",
                  style: new TextStyle(
                      color: lightblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0)),
            ),  // Name
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                      Container(
                          width: 450,
                          height: 50,
                          child: TextFormField(
                            onChanged: (thename) {
                              Name = thename;
                            },
                            decoration: InputDecoration(
                              fillColor: black,
                              hintText: ' ',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300),
                          )),
                      //====================================================================================row
                    ]
                  //====================================================================================rowEnded
                )),

            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 0.0, bottom: 0.0, right: 375.0),
              child: Text("Category",
                  style: new TextStyle(
                      color: lightblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0)),
            ),  //Category
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                      Container(
                          width: 450,
                          height: 50,
                          child: TextFormField(
                            onChanged: (thecategory) {
                              Category = thecategory;
                            },
                            decoration: InputDecoration(
                              fillColor: black,
                              hintText: ' ',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300),
                          )),
                      //====================================================================================row
                    ]
                  //====================================================================================rowEnded
                )),

            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
              child: Text("Price",
                  style: new TextStyle(
                      color: lightblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0)),
            ),  //Price
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                      Container(
                          width: 450,
                          height: 50,
                          child: TextFormField(
                            onChanged: (theprice) {
                              Price = theprice;
                            },
                            decoration: InputDecoration(
                              fillColor: black,
                              hintText: ' ',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300),
                          )),
                      //====================================================================================row
                    ]
                  //====================================================================================rowEnded
                )),

            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 0.0, bottom: 0.0, right: 350.0),
              child: Text("Description",
                  style: new TextStyle(
                      color: lightblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0)),
            ),  //Description
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                      Container(
                          width: 450,
                          height: 50,
                          child: TextFormField(
                            onChanged: (thedescription) {
                              Description = thedescription;
                            },
                            decoration: InputDecoration(
                              fillColor: black,
                              hintText: ' ',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300),
                          )),
                      //====================================================================================row
                    ]
                  //====================================================================================rowEnded
                )),

            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 0.0, bottom: 0.0, right: 350.0),
              child: Text("Image URL",
                  style: new TextStyle(
                      color: lightblack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0)),
            ),  //Image URL
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                      Container(
                          width: 450,
                          height: 50,
                          child: TextFormField(
                            onChanged: (theurl) {
                             URL = theurl;
                            },
                            decoration: InputDecoration(
                              fillColor: black,
                              hintText: ' ',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: lightblack, width: 2.0),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300),
                          )),
                      //====================================================================================row
                    ]
                  //====================================================================================rowEnded
                )),

            SizedBox(height: 15,),
            Container(
              child: ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    // upload(Category);
                    additem(Name,Category,Description,Price,URL);
                    Navigator.of(context).pop();
                    SnackBar(content:Text('Successfully Added'));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,)
                  ),
            )
          ]),
    );
  }

  // uploadImage() async {
  //   final _storage = FirebaseStorage.instance;
  //   final _picker = ImagePicker();
  //   PickedFile image;
  //
  //   //Check Permissions
  //   await Permission.photos.request();
  //
  //   var permissionStatus = await Permission.photos.status;
  //
  //   if (permissionStatus.isGranted){
  //     //Select Image
  //     image = await _picker.getImage(source: ImageSource.gallery);
  //     var file = File(image.path);
  //
  //     if (image != null){
  //       //Upload to Firebase
  //       var snapshot = await _storage.ref()
  //           .child('folderName/imageName')
  //           .putFile(file);
  //       // .onComplete;
  //
  //       var downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //       setState(() {
  //         imageUrl = downloadUrl;
  //       });
  //     } else {
  //       print('No Path Received');
  //     }
  //
  //   } else {
  //     print('Grant Permissions and try again');
  //   }
  // }

}
