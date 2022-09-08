import 'package:alison/ui/widget/contact_tile.dart';
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
   print(faker.person.firstName());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Contacts')),
      body: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            var contact = _contacts[index];
            print(contact.name);
            return ContactTile(contact: contact,name: contact.name, email: contact.email, phoneNumber: contact.phoneNumber, isFavoritePressed: (){
              setState(() {
                contact.isFavorite = !contact.isFavorite;
                _contacts.sort((a,b){
                  if(a.isFavorite){
                    return -1;
                  } else if(b.isFavorite){
                    return 1;
                  } else {
                    return 0;
                  }
                });
              });
            });
          }),
    );
  }
}
