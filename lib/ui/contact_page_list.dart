import 'package:alison/ui/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../data/contact.dart';

class ContactPageList extends StatefulWidget {
  @override
  State<ContactPageList> createState() => _ContactPageListState();
}

class _ContactPageListState extends State<ContactPageList> {
  final faker = Faker();

  late final List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
   _contacts =  List.generate(60, (index) {
      var faker = Faker();
      return Contact(
          name: '${faker.person.firstName()} ${faker.person.firstName()}',
          phoneNumber: faker.person.random.integer(1000000).toString(),
          email: faker.internet.email());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Contacts')),
      body: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            var contact = _contacts[index];
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
                  onPressed: () {
                    setState(() {
                      contact.isFavorite = !contact.isFavorite;
                    });
                  },
                ),
              ),
            );
          }),
    );
  }
}
