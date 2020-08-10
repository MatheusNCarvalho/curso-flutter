import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/pages/login_page.dart';
import 'package:lojavirtual/widgets/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter's \nClothing",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn()
                                        ? "Entre ou cadastra-se >"
                                        : "Sair",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    if (!model.isLoggedIn()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    }else{
                                      model.signOut();
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        ))
                  ],
                ),
              ),
              Divider(),
              DrawerTile(
                this.pageController,
                icon: Icons.home,
                text: "Início",
                page: 0,
              ),
              DrawerTile(
                this.pageController,
                icon: Icons.list,
                text: "Produtos",
                page: 1,
              ),
              DrawerTile(
                this.pageController,
                icon: Icons.location_on,
                text: "Lojas",
                page: 2,
              ),
              DrawerTile(
                this.pageController,
                icon: Icons.playlist_add_check,
                text: "Meus pedidos",
                page: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
