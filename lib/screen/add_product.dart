import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:project1/main.dart';
import 'package:project1/database/data_base.dart';
import 'package:project1/widget/eleveted_button.dart';
import 'package:project1/widget/eleveted_button_save.dart';
import 'package:project1/provider/provider.dart';
import 'package:project1/widget/text_failed_price.dart';
import 'package:project1/widget/text_form_faild.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var obgect;
    provied pp = Provider.of<provied>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            'Add procuct',
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              ElevettedButton(
                  color: Colors.black,
                  onpreseed: () {
                    pp.uploaldImage();
                  }),
              const SizedBox(
                height: 10,
              ),

              TextformField(
                editinController: pp.name,
                text: ' name ',
                color: Colors.black,
              ),
              TextFormFailedPrice(
                  editinController2: pp.price,
                  text: 'price ',
                  color: Colors.black),
              SizedBox(
                height: 8,
              ),
              Consumer<provied>(
                builder: (contextt, v, child) {
                  return v.isLoding
                      ? CircularProgressIndicator()
                      : ElevetedButton_Save(
                          text: 'Add product',
                          onpreseed: () {
                            if (pp.name.text.isEmpty && pp.price.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "please complete data",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER_LEFT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              if (pp.isAdd) {
                                if (v.image == null) {
                                  v.createProduct('0');
                                } else {
                                  v.createProduct(v.image!.path);
                                }

                                v.selectProduct();

                                Navigator.pop((context));
                              } else {
                                v.updateProduct();
                                v.selectProduct();
                                Navigator.pop((context));
                              }
                            }
                          },
                          color: Colors.green);
                },
              ),
              // Consumer<provied>(
              //     builder: ((context, value, child) => value.image == null
              //         ? Center(child: Text('data'))
              //         : Image.file(value.image!)))
            ],
          ),
        ),
      ),
    );
  }
}
