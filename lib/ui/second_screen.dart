import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondScreen extends StatelessWidget {
  final contact;
  String name;
  String email;
  String phoneNumber;

  SecondScreen(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: const [
              Icon(
                FontAwesomeIcons.solidStar,
                size: 15,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                FontAwesomeIcons.ellipsisVertical,
                size: 16,
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      contact.name,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        FontAwesomeIcons.qrcode,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const
            Icon(
              FontAwesomeIcons.phone,
              size: 16,
            ),
            title: Text(contact.phoneNumber),
            subtitle: Text(contact.email),
            trailing: const Icon(Icons.chat),
          ),
          Container(
            width: double.infinity,
            height: 30,
            color: Colors.grey[200],
            child: const  Padding(
              padding:  EdgeInsets.only(left: 16.0, top: 8),
              child: Text('Recent',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.pen, size: 16,),
        onPressed: (){},
      ),
    );
  }
}
