import 'dart:io';

import 'package:contato/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final _nameFocues = FocusNode();

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
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editContact.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(_editContact);
            if (_editContact.name != null && _editContact.name.isNotEmpty) {
              Navigator.pop(context, _editContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocues);
            }
          },
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
                onTap: () {
                  ImagePicker.pickImage(source: ImageSource.gallery)
                      .then((file) {
                    if (file == null) return;
                   setState(() {
                     _editContact.image = file.path;
                   });
                  });
                },
              ),
              _baseInput(
                label: "Nome",
                change: editName,
                controller: _nameController,
                focus: _nameFocues,
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
      ),
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

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Canclear"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget _baseInput(
      {String label,
      Function change,
      TextInputType inputType,
      TextEditingController controller,
      FocusNode focus}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
      onChanged: change,
      keyboardType: inputType,
      controller: controller,
      focusNode: focus,
    );
  }
}
