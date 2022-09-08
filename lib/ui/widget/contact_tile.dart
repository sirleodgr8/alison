import 'package:flutter/material.dart';

import '../second_screen.dart';

class ContactTile extends StatelessWidget {
  final contact;
  String name;
  String email;
  String phoneNumber;
  void Function() isFavoritePressed;

  ContactTile(
      {required this.name,
        required this.email,
        required this.phoneNumber,
        this.contact,
        required this.isFavoritePressed,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SecondScreen(name: contact.name, email: contact.email, phoneNumber: contact.phoneNumber, contact: contact,))
        );
      },
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.email),
        trailing: IconButton(
            icon: Icon(
              contact.isFavorite ? Icons.star : Icons.star_border,
              color: contact.isFavorite ? Colors.amber : Colors.grey,
            ),
            onPressed: isFavoritePressed
        ),
      ),
    );
  }
}
