import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';

class ProfileImageWidget extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final String imgUrl;

  const ProfileImageWidget(
      {Key? key,
      required this.screenHeight,
      required this.screenWidth,
      required this.imgUrl})
      : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance
      .ref('UserProfiles/${FirebaseAuth.instance.currentUser!.uid}');

  String imageUrl = '';

  File? imageFile;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => imageFile = imageTemporary);

      if (imageFile != null) {
        log(imageFile!.path.toString());
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> _uploadData() async {
    UploadTask uploadTask = storageRef
        .child(FirebaseAuth.instance.currentUser!.uid)
        .putFile(imageFile!);

    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    _addImageInFirebase(imageUrl);
  }

  _addImageInFirebase(String url) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid.substring(0, 20))
        .set({
      'imgUrl': url,
    }, SetOptions(merge: true)).whenComplete(() {});
    if (mounted) {
      setState(() {
        imageUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            context: context,
            builder: (context) => Container(
              height: 230.0,
              width: widget.screenWidth,
              decoration: const BoxDecoration(
                color: primaryColor4,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              ),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.0, left: 30.0),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: const [
                          Image(image: AssetImage('images/gallery.png')),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.0,
                      endIndent: 34.0,
                      height: 37.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 25.0,
                          ),
                          SizedBox(
                            width: 9.0,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(

                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2), //<-- SEE HERE
                      ),
                      onPressed: () {
                        _uploadData();
                      },
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),

                  ]),
                ),
              ]),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: 100.0,
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                    color: primaryColor1,
                    borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: imageFile != null
                      ? Image.file(
                          imageFile!,
                          height: 90.0,
                          width: 90.0,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          image: NetworkImage(
                            widget.imgUrl,
                          ),
                          height: 90.0,
                          width: 90.0,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Positioned(
                bottom: 0.0,
                right: 15.0,
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 15.0,
                          spreadRadius: 0.0,
                          color: Color.fromRGBO(0, 0, 0, 0.17),
                        )
                      ]),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: primaryColor1,
                    size: 20.0,
                  ),
                ))
          ],
        ),
      );
    });
  }
}
