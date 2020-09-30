import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 5, left: 5, top: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          onChanged: signupStore.setName,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo João S.',
                            isDense: true,
                            errorText: signupStore.nameError,
                            
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmado',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Exemplo joão@gmail.com',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    SizedBox(height: 16),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Projeta sua conta',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '(99) 9999-9999',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                    ),
                    SizedBox(height: 16),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    FieldTitle(
                      title: 'Confirma Senha',
                      subtitle: 'Repita a senha',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).accentColor,
                        child: Text('Cadastrar'.toUpperCase()),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta ?',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              ' Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
