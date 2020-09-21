import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highligted: true,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {},
          highligted: false,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highligted: false,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {},
          highligted: false,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {},
          highligted: false,
        ),
      ],
    );
  }
}
