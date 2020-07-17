
import 'package:flutter/material.dart';
import 'package:loja_virtual_v2/tabs/home_tab.dart';
import 'package:loja_virtual_v2/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  final _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}

