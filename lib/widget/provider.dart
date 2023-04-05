import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:project1/ProductModel.dart';
import 'package:project1/widget/data_base.dart';

class provied extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  SqlDb data = SqlDb();
  bool isLoding = false;
  List<Map> listData = [];
  late String id;
  bool isAdd = true;

  File? image;
  final ImagePicker imagepicker = ImagePicker();

  uploaldImage() async {
    var packedImage = await imagepicker.pickImage(source: ImageSource.gallery);
    debugPrint("===image path===${packedImage!.path}");
    if (packedImage != null) {
      image = File(packedImage.path);
      notifyListeners();
    } else {}
  }

  createProduct(String image) {
    isLoding = true;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 500), () {
      data.insertData(name.text, price.text, image);

      isLoding = false;
      notifyListeners();
    });
  }

  selectProduct() {
    isAdd == true;
    data.SelectData().then((value) {
      listData = value!;
      notifyListeners();
    });
  }

  delateDataa(String idd) {
    data.delateData(idd);
    notifyListeners();
  }

  updateProduct() {
    isAdd == false;
    data.updateProducById(id, name.text, price.text, image?.path);
    notifyListeners();
  }
}

// addPRODUCT() {
//    isLoding = true;
//     notifyListeners();
//   //{name: omar, price: 300$}
//   final newUser = {'name': name.text.toString(), 'price': price.text.toString()};
//   listData = [];
//   data.SelectData().then((value) {
//     listData = value!;

//   });
//   listData.add(newUser);
//     isLoding = false;
//   notifyListeners();
//   //
// }
