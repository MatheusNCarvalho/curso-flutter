import 'package:flutter/material.dart';
import 'package:navigacao/components/main_drawer.dart';
import 'package:navigacao/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    String title,
    String subtitle,
    bool value,
    Function(bool) onChange,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  title: 'Sem Glutén',
                  subtitle: 'Só exibi refeições sem glúten!',
                  value: settings.isGlutenFree,
                  onChange: (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibi refeições sem lactose!',
                  value: settings.isLactoseFree,
                  onChange: (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibi refeições sem Veganas!',
                  value: settings.isVegan,
                  onChange: (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Vegetariano',
                  subtitle: 'Só exibi refeições Vegetarianas!',
                  value: settings.isVegetarian,
                  onChange: (value) {
                    setState(() {
                      settings.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
