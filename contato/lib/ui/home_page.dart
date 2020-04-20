
import 'package:contato/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();


  @override
  void initState() {
    super.initState();

    Contact c = Contact();
    c.name = "Matheus Neves";
    c.email = "matheus@hotmail.com";
    c.phone = "92350157";
    helper.saveContact(c);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
