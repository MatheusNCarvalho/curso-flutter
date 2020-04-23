import 'dart:io';

import 'package:contato/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _userEdited = false;
  Contact _editContact;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void editName(String text) {
    _userEdited = true;
    setState(() {
      _editContact.name = text;
    });
  }

  void editEmail(String text) {
    _userEdited = true;
    _editContact.email = text;
  }

  void editPhone(String text) {
    _userEdited = true;
    _editContact.phone = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _editContact.image != null
                        ? FileImage(File(_editContact.image))
                        : AssetImage("images/person.png"),
                  ),
                ),
              ),
            ),
            _baseInput(
              label: "Nome",
              change: editName,
              controller: _nameController,
            ),
            _baseInput(
                label: "Email",
                change: editEmail,
                inputType: TextInputType.emailAddress,
                controller: _emailController),
            _baseInput(
                label: "Telefone",
                change: editEmail,
                inputType: TextInputType.phone,
                controller: _phoneController),
          ],
        ),
      ),
    );
  }

  Widget _baseInput(
      {String label,
      Function change,
      TextInputType inputType,
      TextEditingController controller}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
      onChanged: change,
      keyboardType: inputType,
      controller: controller,
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editContact = Contact();
    } else {
      _editContact = Contact.fromMap(widget.contact.toMap());
    }

    _nameController.text = _editContact.name;
    _emailController.text = _editContact.email;
    _phoneController.text = _editContact.phone;
  }
}
