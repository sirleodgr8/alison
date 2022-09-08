import 'package:alison/ui/contact_page_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Alison Course',
      home: ContactPageList(),
    );
  }
}