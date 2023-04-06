import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1/screen/add_product.dart';
import 'package:project1/database/data_base.dart';
import 'package:project1/provider/provider.dart';
import 'package:project1/screen/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return ChangeNotifierProvider<provied>(
      create: ((context) => provied()),
      child: MaterialApp(home: home()),
    );
  }
} 
 


