import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  File? _image;
  final picker = ImagePicker();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final String? imagePath = _prefs.getString('profile_image');

    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _saveImageToPrefs(String imagePath) async {
    if (_image != null) {
      // List<int> imageBytes = await _image!.readAsBytes();
      // String base64Image = base64Encode(imageBytes);
      await _prefs.setString('profile_image', imagePath);
    }
  }

  Future<void> getImage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
        _saveImageToPrefs(PickedFile.path);
      } else {
        print("No image selected.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          _image != null
              ? Center(
                child: CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(_image!),
                  ),
              )
              : Center(
                child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/men profile.jpg'),
                  ),
              ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: getImage, child: Text("Select Image"))
        ],
      ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? _image;
//   final picker = ImagePicker();
//   late SharedPreferences _prefs;

//   @override
//   void initState() {
//     super.initState();
//     _loadImageFromPrefs();
//   }

//   Future<void> _loadImageFromPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//     final String? imageString = _prefs.getString('profile_image');

//     if (imageString != null) {
//       setState(() {
//         _image = File.fromRawPath(base64Decode(imageString));
//       });
//     }
//   }

//   Future<void> _saveImageToPrefs() async {
//     if (_image != null) {
//       List<int> imageBytes = await _image!.readAsBytes();
//       String base64Image = base64Encode(imageBytes);
//       await _prefs.setString('profile_image', base64Image);
//     }
//   }

//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         _saveImageToPrefs();
//       } else {
//         print("No image selected.");
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade700,
//         centerTitle: true,
//         title: Text(
//           "Profile",
//           style: TextStyle(fontSize: 25),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _image != null
//               ? CircleAvatar(
//                   radius: 70,
//                   backgroundImage: FileImage(_image!),
//                 )
//               : CircleAvatar(
//                   radius: 70,
//                   backgroundImage: AssetImage('assets/men_profile.jpg'),
//                 ),
//           SizedBox(height: 20),
//           ElevatedButton(onPressed: getImage, child: Text("Select Image")),
//         ],
//       ),
//     );
//   }
// }
