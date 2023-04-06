import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project1/provider/provider.dart';
import 'package:project1/screen/add_product.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget { 
  
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    provied pp = Provider.of<provied>(context, listen: false);
    pp.selectProduct();
    //FDFDF
    return Scaffold(
      appBar: AppBar(
        // elevation: 20,
        backgroundColor: Colors.green,
        title: Text('products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ////////////////////////////////////////
            Consumer<provied>(builder: ((context, value, child) {
              if (value.listData.isEmpty) {
                return Center(
                    child: Text(
                  '',
                  style: TextStyle(fontSize: 30),
                ));
              } else {
                return value.isLoding == true
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Dismissible(
                            onUpdate: (details) {
                              print('=====2====');
                            },
                            onResize: (() {
                            }),
                            key: Key(index.toString()),
                            background: Container(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(Icons.update, color: Colors.white),
                                    Text('Move to update',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.delete, color: Colors.white),
                                    Text('Move to trash',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            //....confirm...//
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                value.isAdd = false;
                                value.name.text =
                                    value.listData[index]['productImage'];
                                value.name.text =
                                    value.listData[index]['productName'];
                                value.price.text =
                                    value.listData[index]['productPrice'];
                                value.id =
                                    value.listData[index]['id'].toString();
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: ((context) {
                                  return AddProduct();
                                })));
                              } else {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Confirmation"),
                                      content: const Text(
                                          "Are you sure you want to delete this item?"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            onPressed: () {
                                              value.delateDataa(
                                                  value.listData[index]['id']);
                                              Navigator.pop(context);
                                              value.selectProduct();
                                            },
                                            child: const Text("Delete")),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text("Cancel"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${value.listData[index]['productName']}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                                '${value.listData[index]['productPrice']}'),
                                          ],
                                        ),

                                        value.listData[index]['productImage'] ==
                                                    null ||
                                                value.listData[index]
                                                        ['productImage']
                                                    .toString()
                                                    .isEmpty
                                            ? SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                            : Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),

                            child:  FadeInImage(
                              
                              placeholder: const AssetImage('assets/test.jpg'),
                              image: FileImage(File(value.listData[index]['productImage'])),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              placeholderFit: BoxFit.contain,
                            ),),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),

                        separatorBuilder: ((context, index) {
                          return SizedBox(
                            height: 5.0,
                            width: 50,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                margin: EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 2.0,
                                color:
                                    index.isEven ? Colors.green : Colors.blue,
                              ),
                            ),
                          );
                        }),
                        itemCount: value.listData.length);
              }
            })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pp.isAdd = true;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddProduct())))
              .then((valuer) {});
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}